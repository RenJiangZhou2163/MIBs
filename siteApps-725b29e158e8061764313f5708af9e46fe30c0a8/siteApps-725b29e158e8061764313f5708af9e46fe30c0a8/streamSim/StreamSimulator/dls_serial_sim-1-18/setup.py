from setuptools import setup

# these lines allow the version to be specified in Makefile.private
import os
version = os.environ.get("MODULEVER", "0.0")

setup(
	# install_requires allows you to import a specific version of a module in your scripts 
#	install_requires = ['dls.ca2==1.6'],
	# name of the module
	name = "dls_serial_sim",
	# version: over-ridden by the release script
	version = version,
	packages = ["dls_serial_sim"],
	# define console_scripts to be 
#	entry_points = {'console_scripts': ['test-python-hello-world = dls.serial_sim.serial_sim:main']},
	include_package_data = True,
	zip_safe = False
	)
