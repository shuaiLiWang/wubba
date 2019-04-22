#!/bin/bash

case $1 in
    chainstart)
        echo "chain restart, set permission"
        cleos --wallet-url http://127.0.0.1:6666 system newaccount useraaaaaaak game12lizard EOS8Znrtgwt8TfpmbVpTKvA2oB8Nqey625CLN8bCN3TEbgx86Dsvr --buy-ram "1000 SYS" --stake-net "1000 SYS" --stake-cpu "1000 SYS" --transfer
        cleos --wallet-url http://127.0.0.1:6666 transfer useraaaaaabn game12lizard "10000 SYS"
        cleos --wallet-url http://127.0.0.1:6666 system delegatebw game12lizard game12lizard "1000 SYS" "1000 SYS"
        cleos --wallet-url http://127.0.0.1:6666 set account permission useraaaaaaba active '{"threshold":1,"keys":[{"key":"EOS7yBtksm8Kkg85r4in4uCbfN77uRwe82apM8jjbhFVDgEgz3w8S","weight":1}],"accounts":[{"permission":{"actor":"game12lizard","permission":"eosio.code"},"weight":1}]}' owner -p useraaaaaaba
        cleos --wallet-url http://127.0.0.1:6666 set account permission useraaaaaabb active '{"threshold":1,"keys":[{"key":"EOS7WnhaKwHpbSidYuh2DF1qAExTRUtPEdZCaZqt75cKcixuQUtdA","weight":1}],"accounts":[{"permission":{"actor":"game12lizard","permission":"eosio.code"},"weight":1}]}' owner -p useraaaaaabb
        cleos --wallet-url http://127.0.0.1:6666 set account permission useraaaaaabc active '{"threshold":1,"keys":[{"key":"EOS7Bn1YDeZ18w2N9DU4KAJxZDt6hk3L7eUwFRAc1hb5bp6xJwxNV","weight":1}],"accounts":[{"permission":{"actor":"game12lizard","permission":"eosio.code"},"weight":1}]}' owner -p useraaaaaabc
        cleos --wallet-url http://127.0.0.1:6666 set account permission useraaaaaabd active '{"threshold":1,"keys":[{"key":"EOS7Bn1YDeZ18w2N9DU4KAJxZDt6hk3L7eUwFRAc1hb5bp6xJwxNV","weight":1}],"accounts":[{"permission":{"actor":"game12lizard","permission":"eosio.code"},"weight":1}]}' owner -p useraaaaaabd
        cleos --wallet-url http://127.0.0.1:6666 set account permission useraaaaaaak active '{"threshold":1,"keys":[{"key":"EOS6iwndPo58Y2ihWshfhnFbEBJHGkZtujR1bn7bVLngnTWFA8Hm3","weight":1}],"accounts":[{"permission":{"actor":"game12lizard","permission":"eosio.code"},"weight":1}]}' owner -p useraaaaaaak
        cleos --wallet-url http://127.0.0.1:6666 set account permission game12lizard active '{"threshold":1,"keys":[{"key":"EOS69X3383RzBZj41k73CSjUNXM5MYGpnDxyPnWUKPEtYQmTBWz4D","weight":1}],"accounts":[{"permission":{"actor":"game12lizard","permission":"eosio.code"},"weight":1}]}' owner -p game12lizard
    ;;
    
    temptest)
        #test shuffle for baccarat
        echo "temptest"
        eosio-cpp -abigen lizard.cpp -o lizard.wasm
        cleos --wallet-url http://127.0.0.1:6666 set contract game12lizard ./ lizard.wasm lizard.abi
        # init currencyinfo
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard initsymbol '["useraaaaaaaj","TES","0.1000 TES"]' -p useraaaaaaak
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard initsymbol '["eosio.token","SYS","0.1000 SYS"]' -p useraaaaaaak
        cleos get table game12lizard game12lizard currencyinfo
        
        #tableid=`cleos get table game12lizard game12lizard tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
        #tableid=tableid+1
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard newtable '[230,useraaaaaaba,"4000.0000 SYS", 1, "eosio.token", "SYS", "0.005", "0.002", "5.0000 SYS","1.0000 SYS", "5.0000 SYS","1.0000 SYS","10.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS"]' -p useraaaaaaba useraaaaaaah
        tableid=`cleos get table game12lizard game12lizard tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
        
        for((num=1;num<=1;num++));
        do
            #    cleos --wallet-url http://127.0.0.1:6666 push action game12lizard newtable '['$tableid',useraaaaaaba,"4000.0000 SYS", 1, "eosio.token", "SYS", "0.005", "0.002", "5.0000 SYS","1.0000 SYS", "5.0000 SYS","1.0000 SYS","10.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS"]' -p useraaaaaaba useraaaaaaah
            
            sleep 5s
        done
        
        #cleos --wallet-url http://127.0.0.1:6666 push action game12lizard depositable '['$tableid', "10.0000 SYS"]' -p useraaaaaaba useraaaaaaah
        
        #cleos --wallet-url http://127.0.0.1:6666 push action game12lizard pushaliasnam '["","useraaaaaabd"]' -p useraaaaaabd
        #cleos --wallet-url http://127.0.0.1:6666 push action game12lizard pushaliasnam '["wlsaaa","useraaaaaabd"]' -p useraaaaaabd
        #cleos --wallet-url http://127.0.0.1:6666 push action game12lizard pushaliasnam '["wangls","useraaaaaaah"]' -p useraaaaaaah
        #cleos get table game12lizard game12lizard aliasinfo
        
        #cleos --wallet-url http://127.0.0.1:6666 push action game12lizard depositable '['$tableid', "23000.0000 SYS"]' -p useraaaaaaba
        cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        
        sleep 3s
        #cleos --wallet-url http://127.0.0.1:6666 push action game12lizard upgrading '["1"]' -p useraaaaaaak
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard dealerseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5]' -p useraaaaaaba useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard serverseed '['$tableid',e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabb,"{\"small\": \"1.6000 SYS\",\"total6\": \"1.5000 SYS\",\"tri2\": \"1.0000 SYS\"}", useraaaaaabb, "小马"]' -p useraaaaaabb useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaaba,"{\"small\": \"1.6000 SYS\",\"total6\": \"1.5000 SYS\",\"tri2\": \"1.0000 SYS\"}", useraaaaaabb, "Jack"]' -p useraaaaaaba useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabc,"{\"small\": \"1.6000 SYS\",\"total6\": \"1.5000 SYS\",\"tri2\": \"1.0000 SYS\"}", useraaaaaabb, "风"]' -p useraaaaaabc useraaaaaaah
        #cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabb,"{\"small\": \"2.6000 SYS\",\"total6\": \"3.5000 SYS\",\"tri2\": \"2.0000 SYS\"}", "wls", "wls"]' -p useraaaaaabb useraaaaaaah
        #cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabc,"{\"big\": \"2.6001 SYS\",\"total9\": \"3.5001 SYS\",\"tri2\": \"2.0000 SYS\"}"]' -p useraaaaaabc useraaaaaaah
        cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        
        cleos get table game12lizard game12lizard aliasinfo
        
        sleep 36s
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard endbet '['$tableid']' -p useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard verdealeseed '['$tableid',10]' -p useraaaaaaba useraaaaaaah
        #sleep 3s
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard verserveseed '['$tableid',704]' -p useraaaaaaah
        cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard edittable '['$tableid', 1, "eosio.token", "SYS", "0.8000", "0.2000", "5.0000 SYS","1.0000 SYS", "5.0000 SYS","1.0000 SYS","10.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS"]' -p useraaaaaaba
        # cleos --wallet-url http://127.0.0.1:6666 push action game12lizard dealerwitdaw '['$tableid', "20.0000 SYS"]' -p useraaaaaaba
        # cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        
        # cleos --wallet-url http://127.0.0.1:6666 push action game12lizard closetable '['$tableid']' -p useraaaaaaba
        # cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        
        # cleos --wallet-url http://127.0.0.1:6666 push action game12lizard changeprivat '[0, '$tableid']' -p useraaaaaaba
        # cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        
    ;;
    erasedata)
        #the second parameter is (103718369455 = erase end&&pause|| -2 = erase close)
        echo "erase old data(second parameter is (103718369455 = erase end&&pause|| -2 = erase close)"
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard clear12cache '['$2']' -p useraaaaaaak
    ;;
    importdata)
        echo "importdata test"
        nums=(29 100 13 8 91 44);
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard import12data '[155,0,"useraaaaaaba","0","0","100.0000 SYS","2.0000 SYS","3.0000 SYS","4.0000 SYS","5.0000 SYS","6.0000 SYS","7.0000 SYS","8.0000 SYS","9.0000 SYS","10.0000 SYS","11.0000 SYS","12.0000 SYS","13.0000 SYS","14.0000 SYS","15.0000 SYS","16.0000 SYS","17.0000 SYS",0.003,0.002,"0",{"symbol":"4,TES","contract":"useraaaaaaaj"}]' -p useraaaaaaak
        #cleos --wallet-url http://127.0.0.1:6666 push action game12lizard import12data '[13,${nums[@]}]' -p useraaaaaaak
    ;;
    shuffle)
        #test shuffle for baccarat
        echo "test shuffle"
        eosio-cpp -abigen game12lizard.cpp -o game12lizard.wasm
        cleos --wallet-url http://127.0.0.1:6666 set contract game12lizard ./ game12lizard.wasm game12lizard.abi
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard newtable '[useraaaaaaba,"23000.0000 SYS", 1, "1.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS"]' -p useraaaaaaba
        tableid=`cleos get table game12lizard game12lizard tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
        
        for((num=1;num<=2;num++));
        do
            cleos --wallet-url http://127.0.0.1:6666 push action game12lizard dealerseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5]' -p useraaaaaaba useraaaaaaah
            cleos --wallet-url http://127.0.0.1:6666 push action game12lizard serverseed '['$tableid',e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaah
            cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabb,"500.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaabb useraaaaaaah
            cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabc,"0.0000 SYS","100.0000 SYS","0.0000 SYS","10.0000 SYS","10.0000 SYS"]' -p useraaaaaabc useraaaaaaah
            cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
            sleep 36s
            cleos --wallet-url http://127.0.0.1:6666 push action game12lizard endbet '['$tableid']' -p useraaaaaaah
            cleos --wallet-url http://127.0.0.1:6666 push action game12lizard verdealeseed '['$tableid',10]' -p useraaaaaaba
            sleep 3s
            cleos --wallet-url http://127.0.0.1:6666 push action game12lizard verserveseed '['$tableid',704]' -p useraaaaaaah
            cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        done
    ;;
    
    pausetable)
        #test pausetable for baccarat
        echo "test pausetable continuetable and closetable"
        eosio-cpp -abigen game12lizard.cpp -o game12lizard.wasm
        cleos --wallet-url http://127.0.0.1:6666 set contract game12lizard ./ game12lizard.wasm game12lizard.abi
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard newtable '[useraaaaaaba,"23000.0000 SYS", 1, "0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS"]' -p useraaaaaaba
        tableid=`cleos get table game12lizard game12lizard tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
        cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard pausetabledea '['$tableid']' -p useraaaaaaba useraaaaaaah
        cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard dealerseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5]' -p useraaaaaaba useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard serverseed '['$tableid',e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaah
        
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard continuetable '['$tableid']' -p useraaaaaaba
        cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard hashseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5,e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaba useraaaaaaah
        
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabb,"500.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaabb useraaaaaaah
        #cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabc,"0.0000 SYS","100.0000 SYS","0.0000 SYS","10.0000 SYS","10.0000 SYS"]' -p useraaaaaabc useraaaaaaah
        cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        sleep 36s
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard endbet '['$tableid']' -p useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard verdealeseed '['$tableid',10]' -p useraaaaaaba
        sleep 3s
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard verserveseed '['$tableid',704]' -p useraaaaaaah
        cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard closetable '['$tableid']' -p useraaaaaaba
        cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard continuetable '['$tableid']' -p useraaaaaaba
        cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        
    ;;
    normalflow)
        echo "normalflow test"
        eosio-cpp -abigen game12lizard.cpp -o game12lizard.wasm
        cleos --wallet-url http://127.0.0.1:6666 set contract game12lizard ./ game12lizard.wasm game12lizard.abi
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard newtable '[useraaaaaaba,"230.0000 SYS", 1, "0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS"]' -p useraaaaaaba
        tableid=`cleos get table game12lizard game12lizard tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
        
        #  cleos --wallet-url http://127.0.0.1:6666 push action game12lizard newtable '[useraaaaaabb,"23000.0000 SYS"]' -p useraaaaaabb
        #  cleos --wallet-url http://127.0.0.1:6666 push action game12lizard newtable '[useraaaaaaba,"24202.0000 SYS"]' -p useraaaaaaba
        #second index
        #  cleos get table game12lizard game12lizard tablesinfo --index 2 --key-type name -L useraaaaaabb -U useraaaaaabb
        
        cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token game12lizard
        cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaaba
        cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaabb
        cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaabc
        
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard dealerseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5]' -p useraaaaaaba useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard serverseed '['$tableid',e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaah
        
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabb,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaabb useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabc,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaabc useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabd,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaabd useraaaaaaah
        cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        sleep 36s
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard endbet '['$tableid']' -p useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard verdealeseed '['$tableid',10]' -p useraaaaaaba
        sleep 3s
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard verserveseed '['$tableid',704]' -p useraaaaaaah
        cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        sleep 3s
        cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token game12lizard
        cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaaba
        cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaabb
        cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaabc
        sleep 3s
        
    ;;
    trusteeship)
        # start
        
        echo "trusteeship test"
        eosio-cpp -abigen lizard.cpp -o lizard.wasm
        cleos --wallet-url http://127.0.0.1:6666 set contract game12lizard ./ lizard.wasm lizard.abi
        #tableid=`cleos get table game12lizard game12lizard tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
        #tableid=tableid+1
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard newtable '[30,useraaaaaaba,"4000.0000 SYS", 1, "eosio.token", "SYS", "0.005", "0.002", "5.0000 SYS","1.0000 SYS", "5.0000 SYS","1.0000 SYS","10.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS"]' -p useraaaaaaba useraaaaaaah
        tableid=`cleos get table game12lizard game12lizard tablesinfo -l 30 -U 30|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
        
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard upgrading '["1"]' -p useraaaaaaak
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard trusteeship '['$tableid']' -p useraaaaaaba useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard dealerseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5]' -p useraaaaaaba useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard serverseed '['$tableid',e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaah
        
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabb,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaabb useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabc,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaabc useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabd,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaabd useraaaaaaah
        cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        sleep 36s
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard endbet '['$tableid']' -p useraaaaaaah
        # cleos --wallet-url http://127.0.0.1:6666 push action game12lizard verdealeseed '['$tableid',"1w1"]' -p useraaaaaaba
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard verserveseed '['$tableid',"2l3wxx2"]' -p useraaaaaaah
        cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        sleep 3s
    ;;
    exitruteship)
        echo "exitruteship test"
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard newtable '[14,useraaaaaaba,"4000.0000 SYS", 1, "eosio.token", "SYS", "0.005", "0.002", "5.0000 SYS","1.0000 SYS", "5.0000 SYS","1.0000 SYS","10.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS","5.0000 SYS","1.0000 SYS"]' -p useraaaaaaba useraaaaaaah
        tableid=`cleos get table game12lizard game12lizard tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
        
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard exitruteship '['$tableid']' -p useraaaaaaba useraaaaaaah
        for((num=1;num<=1;num++));
        do
            echo "this roundId: $num"
            cleos --wallet-url http://127.0.0.1:6666 push action game12lizard dealerseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5]' -p useraaaaaaba useraaaaaaah
            cleos --wallet-url http://127.0.0.1:6666 push action game12lizard serverseed '['$tableid',e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaah
            
            cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabb,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaabb useraaaaaaah
            cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabc,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaabc useraaaaaaah
            cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabd,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaabd useraaaaaaah
            cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
            sleep 36s
            cleos --wallet-url http://127.0.0.1:6666 push action game12lizard endbet '['$tableid']' -p useraaaaaaah
            cleos --wallet-url http://127.0.0.1:6666 push action game12lizard verdealeseed '['$tableid',1w1]' -p useraaaaaaba
            sleep 3s
            cleos --wallet-url http://127.0.0.1:6666 push action game12lizard verserveseed '['$tableid',2l3wxx2]' -p useraaaaaaah
            cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
            sleep 3s
        done
    ;;
    disconnect)
        echo "dealer disconnect test"
        tableid=`cleos get table game12lizard game12lizard tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
        
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard exitruteship '['$tableid']' -p useraaaaaaba
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard hashseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5,e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaba useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabb,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaabb useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabc,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaabc useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard playerbet '['$tableid',useraaaaaabd,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaabd useraaaaaaah
        cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        sleep 36s
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard endbet '['$tableid']' -p useraaaaaaah
        # cleos --wallet-url http://127.0.0.1:6666 push action game12lizard verdealeseed '['$tableid',"10"]' -p useraaaaaaba
        sleep 3s
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard verserveseed '['$tableid',"704"]' -p useraaaaaaah
        cleos get table game12lizard game12lizard tablesinfo -L $tableid -U $tableid
        sleep 3s
    ;;
esac









