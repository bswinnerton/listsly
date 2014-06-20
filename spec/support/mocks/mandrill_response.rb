require 'spec_helper'

MANDRILL_RESPONSE = [{
  'event'=>'inbound',
  'msg' => {
    'from_email' => 'bill@microsoft.com',
    'from_name' => 'Bill catlover Gates',
    'email' => 'cats@lists.ly',
    'to' => [['cats@lists.ly', 'Cats']],
    'headers' => { 'Date' => Time.now - 1.day },
    'text' => 'I really like cats',
    'html' => '<h1>I REALLY LIKE CATS</h1>'
  }
}]
