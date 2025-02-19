# HASHICORP SETUP IN DOCKER
This repository will contain a working docker-compose solution for Hashicorp Vault

## BASIC ROOT SETUP
1. Go to "http://localhost:8200/ui/vault/dashboard"
2. Enter how many keys you want, and how many is needed to log in (5:3 is normal)
3. Secure the keys wherever it is safe enough
4. Log in with 3 keys and the root token

## CREATE A SECRET ENGINE
1. Go to "http://localhost:8200/ui/vault/secrets" or "Secrets Engines" option in the menu
2. Click "Enable new engine"
3. Choose "KV"
4. Fill out the path and number of versions (i.e. "test_eng" and "1")

## CREATE A SECRET
1. Go to "http://localhost:8200/ui/vault/secrets/[ENGINE_NAME]/kv/list" or select the engine on "Dashboard" or "Secrets Engines" option in the menu
2. Click "Create secret"
3. Fill out the path (i.e. "my_secret")
4. Give your secret a key and a value (i.e. "Password" and "1234")
5. Click "Add"
6. Click "Save"

## CREATE A POLICY
1. Go to "http://localhost:8200/ui/vault/policies/acl" or "Policies" option in the menu
2. Click "Create ACL policy"
3. Give it a name (i.e. "test_policy")
4. Enter the code below
```
path "[ENGINE_NAME]/*" {
  capabilities = ["read"]
}
```

## CREATE A USER
1. Go to "http://localhost:8200/ui/vault/access" or "Access" option in the menu
2. Click "Enable new method"
3. Choose "Username & Password"
4. Fill out the path (i.e. "userpass")
5. Click "Enable method"
6. Go back to "Access"
7. Click on "userpass" or your chosen path
8. Click "Create user"
9. Fill out username and password (i.e. "user" and "pass")
10. Click "Save"

## ADD POLICY TO USER
1. Go to "http://localhost:8200/ui/vault/access" or "Access" option in the menu
2. Go to "http://localhost:8200/ui/vault/access/identity/entities" or "Entities" option in the menu
3. Go to your new entity, If nothing is there, login with your user first, then try again
4. Click "Edit entity"
5. Add a policy
6. Click "Save"