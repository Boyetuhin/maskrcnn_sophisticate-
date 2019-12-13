__author__ = 'mangalbhaskar'
__version__ = '1.0'
"""
# Main file to generate all the absolute paths used anywhere in the workflow.
# It uses the environment variables configuration generated.
# NOTE: All the absolute base path should be generated and stored in environment variables!
# --------------------------------------------------------
# Copyright (c) 2019 Vidteq India Pvt. Ltd.
# Licensed under [see LICENSE for details]
# Written by mangalbhaskar
# --------------------------------------------------------
"""
import yaml
import os
import os.path as osp

## sudo pip install -U python-dotenv
import dotenv

# Create .env file path
this_dir = osp.dirname(__file__)
dotenvPath = osp.join(this_dir,'config','export.sh')

## TODO: if dotenvPath does not exists, error and ask to generate environment variables by running setup script

# Load file from the path
dotenv.load_dotenv(dotenvPath)

## cfg is mutable and contains all the 'absolute path' for the applications to work
cfg = {}

# AI_ENVVARS = ['AI_DATA','AI_WEB_APP_UPLOADS','VM_HOME','LOG_DIR','AI_ANNON_HOME','GOOGLE_APPLICATION_CREDENTIALS','AI_DOC','FRCN_ROOT','AI_WEB_APP','AI_ANNON_DB','PY_VENV_PATH','AI_MODEL_CFG_PATH','CAFFE_ROOT','APACHE_HOME','AI_HOME_EXT','AI_WEIGHTS_PATH','AI_WEB_APP_LOGS','AI_REPORTS','AI_HOME','AI_MNT','MRCNN_ROOT','AI_CFG','AI_SCRIPTS','AI_APP','AI_LOGS','AI_KBANK','AI_ANNON_DATA_HOME','PYTHONPATH']
# AI_PY_ENVVARS = ['AI_APP','AI_HOME_EXT','CAFFE_ROOT',MASK_RCNN','FASTER_RCNN']

def get_from_envvars(env_var_name, cfg_param=None):
  """
  Automatically gets the environment variable names
  This saves manually updating this file to include new environment variables
  """
  envvars = os.getenv(env_var_name)
  ## check for None and emptiness
  if envvars:
    envvars = envvars.split(':')
    for envvar in envvars:
      ## check for emptiness: case-1) AI_ENVVARS=':'
      if envvar:
        if not cfg_param and envvar not in cfg:
          cfg[envvar] = os.getenv(envvar)
        elif cfg_param:
          if cfg_param not in cfg:
            cfg[cfg_param] = {}
          cfg[cfg_param][envvar] = os.getenv(envvar)


def yaml_safe_dump(filepath, o):
  """Create yaml file from python dictionary object
  """
  with open(filepath,'w') as f:
    yaml.safe_dump(o, f, default_flow_style=False)


def load_yaml(filepath):
  """Sale load YAML file (does not provide edit object)
  """
  fc = None
  with open(filepath, 'r') as f:
    # fc = edict(yaml.load(f))
    # fc = edict(yaml.safe_load(f))
    fc = yaml.safe_load(f)

  return fc


if __name__ == '__main__':
  ## get from variables
  get_from_envvars('AI_ENVVARS')
  
  ## get from python paths variable
  get_from_envvars('AI_PY_ENVVARS', cfg_param='PYTHONPATH')

  yml_file = "paths.yml"
  yml_filepath = osp.join(osp.dirname(__file__),'..','config',yml_file)
  print("yml_filepath: {}".format(yml_filepath))
  yaml_safe_dump(yml_filepath, cfg)