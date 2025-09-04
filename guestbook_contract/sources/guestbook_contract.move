#[allow(unused)]

module guestbook_contract::guestbook_contract;

use std::string::{Self, String};
use sui::coin::Coin;
use sui::sui::SUI;

// Constants
const MAX_LENGTH: u64 = 100;
const EInvalidLength: u64 = 1;
// const EUnauthorized: u64 = 2;
const EMessageTooLong: u64 = 3;

// Structs
public struct Message has store {
    sender: address,
    content: String,
    timestamp: u64,
}

public struct GuestBook has key, store {
    id: UID,
    messages: vector<Message>,
    number_of_messages: u64,
    // admin: address, // The admin of the guestbook
    created_at: u64,
}

// Initialize a new guestbook
fun init(ctx: &mut TxContext) {
    let guestbook = GuestBook {
        id: object::new(ctx),
        messages: vector::empty<Message>(),
        number_of_messages: 0,
        created_at: ctx.epoch(),
    };

    // Transfer ownership to the sender
    sui::transfer::share_object(guestbook);
}

// Post a message to the guestbook
public fun post_message(guestbook: &mut GuestBook, message: Message, ctx: &mut TxContext) {
    let message_length = string::length(&message.content);

    assert!(message_length > 0, EInvalidLength);
    assert!(message_length <= MAX_LENGTH, EMessageTooLong);

    vector::push_back(&mut guestbook.messages, message);
    guestbook.number_of_messages = guestbook.number_of_messages + 1;
}

// Create a new message
public fun create_message(message: vector<u8>, ctx: &mut TxContext): Message {
    let message_string = string::utf8(message);
    let length = string::length(&message_string);

    assert!(length > 0 && length <= MAX_LENGTH, EInvalidLength);

    Message {
        sender: ctx.sender(),
        content: string::utf8(message),
        timestamp: ctx.epoch(),
    }
}

// Get the number of messages in the guestbook
public fun get_message_count(guestbook: &GuestBook): u64 {
    guestbook.number_of_messages
}
