# LikesCounter

This gem return the fan counter (likes) for a page on facebook.

## Installation

Add this line to your application's Gemfile:

    gem 'likes_counter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install likes_counter

## Usage

    LikesCounter::Page.by_id(<page_id>)
    # or multiple
    LikesCounter::Page.by_id(<page_id>, <page_id>, ...)

