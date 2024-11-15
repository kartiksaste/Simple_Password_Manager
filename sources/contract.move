module Passwordsend::PasswordManager {

    use aptos_framework::signer;

    /// Struct to store a password.
    struct PasswordStore has store, key {
        password: vector<u8>,  // Password stored as a byte array
    }

    /// Function to save a password for the user.
    public fun save_password(owner: &signer, password: vector<u8>) {
        let password_store = PasswordStore { password };
        move_to(owner, password_store);
    }

    /// Function to retrieve the stored password.
    public fun retrieve_password(requester: &signer): vector<u8> acquires PasswordStore {
        let stored_password = borrow_global<PasswordStore>(signer::address_of(requester));
        stored_password.password
    }
}
