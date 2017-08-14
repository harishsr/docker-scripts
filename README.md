# README

After downloading this script, make sure to give the script executable
privilege before running it:

```bash
chmod u+x gitlab_instance.sh
```

Then you can simply run it:

```bash
./gitlab_instance.sh
```

#### What it does

This script will create a docker instance of GitLab using the version you
specify when it is run.  When specifying the version, specify the full
version.  Example: `9.0.12-ee.0`.  It will then give the installation a name
once it is created.
