# udocker Custom Executor Driver

This project contains a driver for GitLab Runner's Custom Executor that will uses udocker to execute the jobs. Similar to the standard docker executor, it requires that the image defined in `gitlab-ci.yml` contains `bash` and `git`.

The `prepare.sh` and `run.sh` scripts pass any arguments given to them on to `udocker create` and `udocker run` respectively.

Currently, [a patched version of udocker](https://github.com/robeverest/udocker) is required for this driver to work.
