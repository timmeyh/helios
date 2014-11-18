import os
import glob
import testding
modules = glob.glob(os.path.dirname(__file__)+"/coremods/*.py")
__all__ = [ os.path.basename(f)[:-3] for f in modules]
