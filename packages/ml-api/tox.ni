[tox]
envlist = py36, py37, py38
skipsdist = True


[testenv]
install_command = pip install --pre {opts} {packages}
deps =
    -rrequirements.txt

passenv =
      PIP_EXTRA_INDEX_URL
      KERAS_BACKEND

setenv =
  PYTHONPATH=.

commands =
     pytest \
           -s \
           -v \
           -m "not differential" \
           {posargs:tests}


# content of pytest.ini
[pytest]
markers =
    integration: mark a test as an integration test.
	differential: mark a test as a differential test.
filterwarnings =
    ignore::DeprecationWarning
