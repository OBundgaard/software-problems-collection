ui = true
disable_mlock = true

storage "file" {
  path = "/vault/file"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1  # Disable TLS for local development
}

api_addr = "http://0.0.0.0:8200"