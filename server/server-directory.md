# Server directory

## data
suggest using a 3-layer structure:
- private: not public accessible, auth required file
- public: public accessible, but no listing
- share: public accessible, with listing

sample code to create the structure, with symlink for quick access: 
```shell script
cd data/
mkdir -p private/public/share/
ln -sfT private/public public
ln -sfT private/public/share share
```
