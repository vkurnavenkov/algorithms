Challenge: Write an in-memory, key-value value store that can "time travel."

## Basic operations

You should be able to get and set values for arbitrary keys. In Ruby, this might look something like:

```ruby
kv = KV.new
kv.set('foo', 'bar')
kv.get('foo')
=>  "bar"
```

## Intermediate operations

If a timestamp is provided for a given key, fetch the value for that key at that particular time. If no timestamp is supplied, fetch the most recently set value for that key. In Ruby, this might look like:

```ruby
kv = KV.new
timestamp = kv.set('foo', 'bar')
sleep(1)
kv.set('foo', 'bar2')

# Fetch the key 'foo' with the correct timestamp
kv.get('foo', timestamp)
=> "bar"

# Fetch the key 'foo' without a timestamp
kv.get('foo')
=> "bar2" # returns the last set value
```

## Advanced Operations

Support 'fuzzy' matching on a timestamp.

```ruby
kv = KV.new
timestamp = kv.set('foo', 'bar')
sleep(3)
kv.set('foo', 'bar2')

# Fetch the key 'foo' with the 'now' timestamp, plus 2 seconds
kv.get('foo', timestamp + 2)
=> "bar" # returns the closest set value to that timestamp, but always in the past
```
