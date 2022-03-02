# Updating the cudawrappers to a different tag

```shell
# check the current tag/ref of the dependency:
git submodule status external/cudawrappers/

# update the submodule to a tag, e.g. 0.2.0
cd external/cudawrappers
git fetch origin
git checkout 0.2.0

# commit the change
cd ../..
git add external/cudawrappers
git commit -m "updated the cudawrappers submodule to tag 0.2.0"
```
