function cbssh --description 'Copy (default) SSH public key to a clipboard'
  cat ~/.ssh/id_rsa.pub | cb
end
