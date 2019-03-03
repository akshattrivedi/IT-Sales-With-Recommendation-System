from simple_aes_cipher import AESCipher, generate_secret_key

pass_phrase = "7GoodLuck7"
secret_key = generate_secret_key(pass_phrase)

# generate cipher
cipher = AESCipher(secret_key)

raw_text = "Harry123"
encrypt_text = cipher.encrypt(raw_text)
#assert raw_text != encrypt_text

#val = input()
decrypt_text = cipher.decrypt("X6V/at019poicvvLL2H/vYEm07ofH0jO8Z4gGs1Gotw=")
#assert encrypt_text != decrypt_text
#assert decrypt_text == raw_text

print(pass_phrase)
print(raw_text)
print(decrypt_text)
print()

print("Cipher Text:",cipher)
print("Encrypted Text",encrypt_text)
print("Encrypted Text (Length):",len(encrypt_text))
print("Secret Key:",secret_key)
