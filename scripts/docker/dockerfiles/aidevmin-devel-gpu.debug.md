WARNING: apt does not have a stable CLI interface. Use with caution in scripts.



  Building wheel for pyrsistent (setup.py): finished with status 'done'
  Created wheel for pyrsistent: filename=pyrsistent-0.15.6-cp36-cp36m-linux_x86_64.whl size=97620 sha256=6f629952706e96f4d45fcd293e41033393e7c97ef8d0d43d6bdaca13fbf5dcfe
  Stored in directory: /tmp/pip-ephem-wheel-cache-39he0gy8/wheels/83/89/d3/1712b9c33c9b9c0911b188a86aeff2a9a05e113f986cf79d92
Successfully built PyYAML easydict jupyter-nbextensions-configurator mpmath backcall tornado python-gflags msgpack-python wrapt prometheus-client pandocfilters pyrsistent
ERROR: jupyter-console 6.0.0 has requirement prompt-toolkit<2.1.0,>=2.0.0, but you'll have prompt-toolkit 3.0.0 which is incompatible.
ERROR: locustio 0.13.2 has requirement gevent==1.5a2, but you'll have gevent 1.4.0 which is incompatible.


  Building wheel for Mayavi (setup.py): started
  Building wheel for Mayavi (setup.py): finished with status 'error'
  ERROR: Command errored out with exit status 1:
   command: /virtualmachines/virtualenvs/py_3_20191128_1354/bin/python3 -u -c 'import sys, setuptools, tokenize; sys.argv[0] = '"'"'/tmp/pip-install-o2z3e3r4/Mayavi/setup.py'"'"'; __file__='"'"'/tmp/pip-install-o2z3e3r4/Mayavi/setup.py'"'"';f=getattr(tokenize, '"'"'open'"'"', open)(__file__);code=f.read().replace('"'"'\r\n'"'"', '"'"'\n'"'"');f.close();exec(compile(code, __file__, '"'"'exec'"'"'))' bdist_wheel -d /tmp/pip-wheel-_v0xnfi5 --python-tag cp36
       cwd: /tmp/pip-install-o2z3e3r4/Mayavi/
  Complete output (33 lines):
  running bdist_wheel
  running build
  Traceback (most recent call last):
    File "<string>", line 1, in <module>
    File "/tmp/pip-install-o2z3e3r4/Mayavi/setup.py", line 474, in <module>
      **config
    File "/virtualmachines/virtualenvs/py_3_20191128_1354/lib/python3.6/site-packages/numpy/distutils/core.py", line 171, in setup
      return old_setup(**new_attr)
    File "/virtualmachines/virtualenvs/py_3_20191128_1354/lib/python3.6/site-packages/setuptools/__init__.py", line 145, in setup
      return distutils.core.setup(**attrs)
    File "/usr/lib/python3.6/distutils/core.py", line 148, in setup
      dist.run_commands()
    File "/usr/lib/python3.6/distutils/dist.py", line 955, in run_commands
      self.run_command(cmd)
    File "/usr/lib/python3.6/distutils/dist.py", line 974, in run_command
      cmd_obj.run()
    File "/virtualmachines/virtualenvs/py_3_20191128_1354/lib/python3.6/site-packages/wheel/bdist_wheel.py", line 192, in run
      self.run_command('build')
    File "/usr/lib/python3.6/distutils/cmd.py", line 313, in run_command
      self.distribution.run_command(command)
    File "/usr/lib/python3.6/distutils/dist.py", line 974, in run_command
      cmd_obj.run()
    File "/tmp/pip-install-o2z3e3r4/Mayavi/setup.py", line 268, in run
      build_tvtk_classes_zip()
    File "/tmp/pip-install-o2z3e3r4/Mayavi/setup.py", line 254, in build_tvtk_classes_zip
      gen_tvtk_classes_zip()
    File "tvtk/setup.py", line 83, in gen_tvtk_classes_zip
      from tvtk.code_gen import TVTKGenerator
    File "/tmp/pip-install-o2z3e3r4/Mayavi/tvtk/code_gen.py", line 10, in <module>
      import vtk_module as vtk
    File "tvtk/vtk_module.py", line 15, in <module>
      from vtk import *
  ModuleNotFoundError: No module named 'vtk'
  ----------------------------------------
  ERROR: Failed building wheel for Mayavi
  Running setup.py clean for Mayavi
  Building wheel for annoy (setup.py): started
  Building wheel for annoy (setup.py): finis


## CUDA9.0 with tensorflow-1.13.1

@baaz:18:42:01:docker$source /codehub/scripts/docker/docker.createcontainer-aidev.sh mangalbhaskar/aimldl:9.0-cudnn-7.6.4.38-devel-ubuntu16.04-aidev-v5-20191130_1838 aidev-devel-gpu

  @baaz:17:58:07:readme$locate libcublas
/usr/local/cuda-10.0/doc/man/man7/libcublas.7
/usr/local/cuda-10.0/doc/man/man7/libcublas.so.7
/usr/local/cuda-10.0/targets/x86_64-linux/lib/libcublas.so
/usr/local/cuda-10.0/targets/x86_64-linux/lib/libcublas.so.10.0
/usr/local/cuda-10.0/targets/x86_64-linux/lib/libcublas.so.10.0.130
/usr/local/cuda-10.0/targets/x86_64-linux/lib/libcublas_static.a
/usr/local/cuda-10.0/targets/x86_64-linux/lib/stubs/libcublas.so


>>> import tensorflow as tf
Traceback (most recent call last):
  File "/virtualmachines/virtualenvs/py_3_20191130_1838/lib/python3.5/site-packages/tensorflow/python/pywrap_tensorflow.py", line 58, in <module>
    from tensorflow.python.pywrap_tensorflow_internal import *
  File "/virtualmachines/virtualenvs/py_3_20191130_1838/lib/python3.5/site-packages/tensorflow/python/pywrap_tensorflow_internal.py", line 28, in <module>
    _pywrap_tensorflow_internal = swig_import_helper()
  File "/virtualmachines/virtualenvs/py_3_20191130_1838/lib/python3.5/site-packages/tensorflow/python/pywrap_tensorflow_internal.py", line 24, in swig_import_helper
    _mod = imp.load_module('_pywrap_tensorflow_internal', fp, pathname, description)
  File "/virtualmachines/virtualenvs/py_3_20191130_1838/lib/python3.5/imp.py", line 242, in load_module
    return load_dynamic(name, filename, file)
  File "/virtualmachines/virtualenvs/py_3_20191130_1838/lib/python3.5/imp.py", line 342, in load_dynamic
    return _load(spec)
ImportError: libcublas.so.10.0: cannot open shared object file: No such file or directory

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/virtualmachines/virtualenvs/py_3_20191130_1838/lib/python3.5/site-packages/tensorflow/__init__.py", line 24, in <module>
    from tensorflow.python import pywrap_tensorflow  # pylint: disable=unused-import
  File "/virtualmachines/virtualenvs/py_3_20191130_1838/lib/python3.5/site-packages/tensorflow/python/__init__.py", line 49, in <module>
    from tensorflow.python import pywrap_tensorflow
  File "/virtualmachines/virtualenvs/py_3_20191130_1838/lib/python3.5/site-packages/tensorflow/python/pywrap_tensorflow.py", line 74, in <module>
    raise ImportError(msg)
ImportError: Traceback (most recent call last):
  File "/virtualmachines/virtualenvs/py_3_20191130_1838/lib/python3.5/site-packages/tensorflow/python/pywrap_tensorflow.py", line 58, in <module>
    from tensorflow.python.pywrap_tensorflow_internal import *
  File "/virtualmachines/virtualenvs/py_3_20191130_1838/lib/python3.5/site-packages/tensorflow/python/pywrap_tensorflow_internal.py", line 28, in <module>
    _pywrap_tensorflow_internal = swig_import_helper()
  File "/virtualmachines/virtualenvs/py_3_20191130_1838/lib/python3.5/site-packages/tensorflow/python/pywrap_tensorflow_internal.py", line 24, in swig_import_helper
    _mod = imp.load_module('_pywrap_tensorflow_internal', fp, pathname, description)
  File "/virtualmachines/virtualenvs/py_3_20191130_1838/lib/python3.5/imp.py", line 242, in load_module
    return load_dynamic(name, filename, file)
  File "/virtualmachines/virtualenvs/py_3_20191130_1838/lib/python3.5/imp.py", line 342, in load_dynamic
    return _load(spec)
ImportError: libcublas.so.10.0: cannot open shared object file: No such file or directory


Failed to load the native TensorFlow runtime.

See https://www.tensorflow.org/install/errors

