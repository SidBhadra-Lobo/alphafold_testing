from pymol import cmd
import glob

def load_pdbs(files):
  """
  Pymol command line example:
        PyMOL> run load_pdbs *.pdb
  """
  file_stack = glob.glob(files)
  print('Loading files:\n', file_stack)
  assert len(file_stack) > 0
  for i in file_stack:
      cmd.load(i)

cmd.extend('load_files', load_pdbs)

if __name__ == '__main__':
    load_pdbs('../pdb_structures/6WZO*')
    load_pdbs('../output_dir/trimmed6WZO_monomer/*.pdb')