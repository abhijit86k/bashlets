#!/usr/bin/python3

#From: https://superuser.com/a/1810782

import secretstorage

conn = secretstorage.dbus_init()
collection = secretstorage.get_default_collection(conn)
print(collection.is_locked())
collection.unlock()
for item in collection.get_all_items():
    print(item.get_label())
    print(item.get_attributes())
    print(item.get_secret())
    print("-" * 80)
