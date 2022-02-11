#!/usr/bin/env python   
#
# 
#
# $Header: /opt/cvs/VSTutorial/prepare_ligand.py,v 1.3 2006/07/13 18:38:48 lindy Exp $
#
import os 

from MolKit import Read
import MolKit.molecule
import MolKit.protein
MolKit.molecule.bhtreeFlag = 0
MolKit.protein.bhtreeFlag = 0

from AutoDockTools.MoleculePreparation import LigandPreparation



if __name__ == '__main__':
    import sys
    import getopt


    def usage():
        "Print helpful, accurate usage statement to stdout."
        print "Usage: prepare_ligand.py -l filename"
        print
        print "    Description of command..."
        print "        [-l]    ligand_filename"
        print "    Optional parameters:"
        print "        [-v]    verbose output"
        print "        [-o pdbq_filename] (output filename)"
        print "        [-d]    dictionary to write types list and number of active torsions "

        print "        [-A]    type(s) of repairs to make:\n\t\t bonds_hydrogens, bonds, hydrogens, ''"
        print "        [-C]    do not add charges"
        print "        [-K]    add Kollman charges"
        print "        [-U]    cleanup type:\n\t\t nphs_lps, nphs, lps, '' "
        print "        [-B]    type(s) of bonds to allow to rotate"
        print "        [-R]    index for root"
        print "        [-M]    interactive (default is automatic)"


    # process command arguments
    try:
        opt_list, args = getopt.getopt(sys.argv[1:], 'l:vo:d:A:CKU:B:R:Mh')

    except getopt.GetoptError, msg:
        print 'prepare_ligand.py: %s' %msg
        usage()
        sys.exit(2)

    # initialize required parameters
    #-s: ligand
    ligand_filename =  None
    # optional parameters
    verbose = None
    add_bonds = False
    #-b: repairs to make: add bonds and/or hydrogens
    repairs = ""
    #-C  default: add gasteiger charges 
    charges_to_add = 'gasteiger'
    #-K add_Kollman #no opt
    #-U: cleanup by merging nphs_lps, nphs, lps
    cleanup  = "nphs_lps"
    #-R rotatable bond type(s) to fix
    allowed_bonds = ""
    #-r  root
    root = 'auto'
    #-F outputfilename
    outputfilename = None
    #-m mode 
    mode = 'automatic'
    dict = None

    #'l:vo:d:A:CKU:B:R:M'
    for o, a in opt_list:
        if o in ('-l', '--l'):
            ligand_filename = a
            if verbose: print 'set ligand_filename to ', a
        if o in ('-v', '--v'):
            verbose = True
            if verbose: print 'set verbose to ', True
        if o in ('-o', '--o'):
            outputfilename = a
            if verbose: print 'set outputfilename to ', a
        if o in ('-d', '--d'):
            dict = a
            if verbose: print 'set dict to ', a
        if o in ('-A', '--A'):
            repairs = a
            if verbose: print 'set repairs to ', a
        if o in ('-C', '--C'):
            charges_to_add = None
            if verbose: print 'do not add charges'
        if o in ('-K', '--K'):
            charges_to_add = 'Kollman'
            if verbose: print 'add Kollman charges'
        if o in ('-U', '--U'):
            cleanup  = a
            if verbose: print 'set cleanup to merge ', a
        if o in ('-B', '--B'):
            allowed_bonds = a
            if verbose: print 'allow ', a, 'bonds set to rotate'
        if o in ('-R', '--R'):
            root = a
            if verbose: print 'set root to ', root
        if o in ('-M', '--M'):
            mode = a
            if verbose: print 'set mode to ', a
        if o in ('-h', '--'):
            usage()
            sys.exit()


    if not  ligand_filename:
        print 'prepare_ligand: ligand filename must be specified.'
        usage()
        sys.exit()

    #what about nucleic acids???

    mols = Read(ligand_filename)
    if verbose: print 'read ', ligand_filename
    mol = mols[0]
    if len(mols)>1:
        if verbose: 
            print "more than one molecule in file"
        #use the one molecule with the most atoms
        ctr = 1
        for m in mols[1:]:
            ctr += 1
            if len(m.allAtoms)>len(mol.allAtoms):
                mol = m
                if verbose:
                    print "mol set to ", ctr, "th molecule with", len(mol.allAtoms), "atoms"

    #possible clean-up???

    mol.buildBondsByDistance()

    if verbose:
        print "setting up LPO with mode=", mode,
        print "and outputfilename= ", outputfilename
    LPO = LigandPreparation(mol, mode, repairs, charges_to_add, 
                            cleanup, allowed_bonds, root, 
                            outputfilename=outputfilename,
                            dict=dict)
    #do something about atoms with too many bonds (?)
    #FIX THIS: could be peptide ligand (???)
    #          ??use isPeptide to decide chargeSet??

    

# To execute this command type:
# prepare_ligand.py -s pdb_file -v




