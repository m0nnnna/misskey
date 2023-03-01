#!/bin/bash
su postgres -s /bin/bash -lc "pg_dump -d misskey --format=custom > /saves/misskey-`date +%Y-%m-%d-%H-%M`.pgdump"