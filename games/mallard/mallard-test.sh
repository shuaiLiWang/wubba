#!/bin/bash

case $1 in
    chainstart)
        echo "chain restart, set permission"
        cleos --wallet-url http://127.0.0.1:6666 system newaccount useraaaaaaaa gamemallards EOS8Znrtgwt8TfpmbVpTKvA2oB8Nqey625CLN8bCN3TEbgx86Dsvr --buy-ram "1000 SYS" --stake-net "1000 SYS" --stake-cpu "1000 SYS" --transfer
        cleos --wallet-url http://127.0.0.1:6666 transfer useraaaaaaam gamemallards "100000 SYS"
        cleos --wallet-url http://127.0.0.1:6666 set account permission useraaaaaaab active '{"threshold":1,"keys":[{"key":"EOS7yBtksm8Kkg85r4in4uCbfN77uRwe82apM8jjbhFVDgEgz3w8S","weight":1}],"accounts":[{"permission":{"actor":"gamemallards","permission":"eosio.code"},"weight":1}]}' owner -p useraaaaaaab
        cleos --wallet-url http://127.0.0.1:6666 set account permission useraaaaaaac active '{"threshold":1,"keys":[{"key":"EOS7WnhaKwHpbSidYuh2DF1qAExTRUtPEdZCaZqt75cKcixuQUtdA","weight":1}],"accounts":[{"permission":{"actor":"gamemallards","permission":"eosio.code"},"weight":1}]}' owner -p useraaaaaaac
        cleos --wallet-url http://127.0.0.1:6666 set account permission useraaaaaaad active '{"threshold":1,"keys":[{"key":"EOS7Bn1YDeZ18w2N9DU4KAJxZDt6hk3L7eUwFRAc1hb5bp6xJwxNV","weight":1}],"accounts":[{"permission":{"actor":"gamemallards","permission":"eosio.code"},"weight":1}]}' owner -p useraaaaaaad
        cleos --wallet-url http://127.0.0.1:6666 set account permission useraaaaaaae active '{"threshold":1,"keys":[{"key":"EOS6cNcTC6WTFkKV4C8DoxcTXdDTDKvj3vgZEVDGVFckK1eTNJQtf","weight":1}],"accounts":[{"permission":{"actor":"gamemallards","permission":"eosio.code"},"weight":1}]}' owner -p useraaaaaaae
        cleos --wallet-url http://127.0.0.1:6666 set account permission useraaaaaaaf active '{"threshold":1,"keys":[{"key":"EOS8UkmsnCo4GxDihbKwgoZY6f2QLSMEqBZ2frGLckxrCHrz15r7X","weight":1}],"accounts":[{"permission":{"actor":"gamemallards","permission":"eosio.code"},"weight":1}]}' owner -p useraaaaaaaf
        cleos --wallet-url http://127.0.0.1:6666 set account permission useraaaaaaak active '{"threshold":1,"keys":[{"key":"EOS6iwndPo58Y2ihWshfhnFbEBJHGkZtujR1bn7bVLngnTWFA8Hm3","weight":1}],"accounts":[{"permission":{"actor":"gamemallards","permission":"eosio.code"},"weight":1}]}' owner -p useraaaaaaak
        cleos --wallet-url http://127.0.0.1:6666 set account permission gamemallards active '{"threshold":1,"keys":[{"key":"EOS69X3383RzBZj41k73CSjUNXM5MYGpnDxyPnWUKPEtYQmTBWz4D","weight":1}],"accounts":[{"permission":{"actor":"gamemallards","permission":"eosio.code"},"weight":1}]}' owner -p gamemallards
        
        # custom token issue 1.
        cleos --wallet-url http://127.0.0.1:6666 system buyram useraaaaaaag useraaaaaaaj "10 SYS"
        cleos --wallet-url http://127.0.0.1:6666 set contract useraaaaaaaj ../../library/eosio.token eosio.token.wasm eosio.token.abi
        cleos --wallet-url http://127.0.0.1:6666 push action useraaaaaaaj create '["useraaaaaaai","100000000.0000 TES"]' -p useraaaaaaaj
        cleos --wallet-url http://127.0.0.1:6666 push action useraaaaaaaj issue '["useraaaaaaab","10000000.0000 TES","xxx"]' -p useraaaaaaai
        cleos --wallet-url http://127.0.0.1:6666 push action useraaaaaaaj issue '["useraaaaaaac","10000.0000 TES","xxx"]' -p useraaaaaaai
        cleos --wallet-url http://127.0.0.1:6666 push action useraaaaaaaj issue '["useraaaaaaad","10000.0000 TES","xxx"]' -p useraaaaaaai
        cleos --wallet-url http://127.0.0.1:6666 push action useraaaaaaaj issue '["useraaaaaaak","10000.0000 TES","xxx"]' -p useraaaaaaai
        cleos --wallet-url http://127.0.0.1:6666 push action useraaaaaaaj issue '["useraaaaaaaj","10000.0000 TES","xxx"]' -p useraaaaaaai
        cleos --wallet-url http://127.0.0.1:6666 push action useraaaaaaaj issue '["useraaaaaaaf","10000.0000 TES","xxx"]' -p useraaaaaaai
        cleos --wallet-url http://127.0.0.1:6666 get currency balance useraaaaaaaj useraaaaaaaf "TES"
        cleos --wallet-url http://127.0.0.1:6666 get currency balance useraaaaaaaj useraaaaaaab "TES"
        cleos --wallet-url http://127.0.0.1:6666 get currency balance useraaaaaaaj useraaaaaaac "TES"
        cleos --wallet-url http://127.0.0.1:6666 get currency balance useraaaaaaaj useraaaaaaad "TES"
        cleos --wallet-url http://127.0.0.1:6666 get currency balance useraaaaaaaj useraaaaaaak "TES"
        cleos --wallet-url http://127.0.0.1:6666 get currency balance useraaaaaaaj useraaaaaaaj "TES"
         # custom token issue 2.
        cleos --wallet-url http://127.0.0.1:6666 system buyram useraaaaaaag useraaaaaaal "10 SYS"
        cleos --wallet-url http://127.0.0.1:6666 set contract useraaaaaaal ../../library/eosio.token eosio.token.wasm eosio.token.abi
        cleos --wallet-url http://127.0.0.1:6666 push action useraaaaaaal create '["useraaaaaaal","100000000.0000 GDP"]' -p useraaaaaaal
        cleos --wallet-url http://127.0.0.1:6666 push action useraaaaaaal issue '["useraaaaaaab","10000000.0000 GDP","xxx"]' -p useraaaaaaal
        cleos --wallet-url http://127.0.0.1:6666 push action useraaaaaaal issue '["useraaaaaaac","10000.0000 GDP","xxx"]' -p useraaaaaaal
        cleos --wallet-url http://127.0.0.1:6666 push action useraaaaaaal issue '["useraaaaaaad","10000.0000 GDP","xxx"]' -p useraaaaaaal
        cleos --wallet-url http://127.0.0.1:6666 push action useraaaaaaal issue '["useraaaaaaak","10000.0000 GDP","xxx"]' -p useraaaaaaal
        cleos --wallet-url http://127.0.0.1:6666 push action useraaaaaaal issue '["useraaaaaaal","10000.0000 GDP","xxx"]' -p useraaaaaaal
        cleos --wallet-url http://127.0.0.1:6666 get currency balance useraaaaaaal useraaaaaaab "GDP"
        cleos --wallet-url http://127.0.0.1:6666 get currency balance useraaaaaaal useraaaaaaac "GDP"
        cleos --wallet-url http://127.0.0.1:6666 get currency balance useraaaaaaal useraaaaaaad "GDP"
        cleos --wallet-url http://127.0.0.1:6666 get currency balance useraaaaaaal useraaaaaaad "GDP"
        cleos --wallet-url http://127.0.0.1:6666 get currency balance useraaaaaaal useraaaaaaal "GDP"
    ;;
    
    temptest)
        #test shuffle for baccarat
        echo "temptest"
        eosio-cpp -abigen mallard.cpp -o mallard.wasm
        cleos --wallet-url http://127.0.0.1:6666 set contract gamemallards ./ mallard.wasm mallard.abi
        # init currencyinfo
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards initsymbol '["useraaaaaaaj","TES","0.1000 TES"]' -p useraaaaaaak
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards initsymbol '["useraaaaaaal","GDP","0.1000 GDP"]' -p useraaaaaaak
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards initsymbol '["eosio.token","SYS","0.1000 SYS"]' -p useraaaaaaak
        # error test
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards initsymbol '["useraaaaaaaa","GDP","0.1000 GDP"]' -p useraaaaaaak
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards initsymbol '["useraaaaaaal","GDA","0.1000 GDA"]' -p useraaaaaaak
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards initsymbol '["useraaaaaaal","GDP","0.1000 GDA"]' -p useraaaaaaak
        
        cleos get table gamemallards gamemallards currencyinfo
        for((num=1;num<=1;num++));
        do
            cleos --wallet-url http://127.0.0.1:6666 push action gamemallards newtable '[20,useraaaaaaab,"4000.0000 TES", 1,"useraaaaaaaj","TES", "0.005", "0.002", "5.0000 TES","1.0000 TES","5.0000 TES","1.0000 TES","5.0000 TES","1.0000 TES"]' -p useraaaaaaab useraaaaaaah
            tableid=`cleos get table gamemallards gamemallards tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
            cleos --wallet-url http://127.0.0.1:6666 push action gamemallards shuffle '['$tableid']' -p useraaaaaaah
            sleep 5s
        done
        
        #cleos --wallet-url http://127.0.0.1:6666 push action gamemallards depositable '[useraaaaaaab, '$tableid', "10.0000 TES"]' -p useraaaaaaab
        
        tableid=`cleos get table gamemallards gamemallards tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
        cleos get table gamemallards gamemallards shuffleinfo -L $tableid -U $tableid
        
        cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        
        # cleos --wallet-url http://127.0.0.1:6666 push action gamemallards depositable '[useraaaaaaab, '$tableid', "23000.0000 TES"]' -p useraaaaaaab
        # cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        
        cleos get table gamemallards gamemallards aliasinfo
        sleep 3s
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards dealerseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5]' -p useraaaaaaab useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards serverseed '['$tableid',e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaah
        cleos get table gamemallards gamemallards shuffleinfo -L $tableid -U $tableid
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaac,"0.0000 TES","2.0000 TES","2.0000 TES","2.0000 TES","2.0000 TES", useraaaaaaah,"小明"]' -p useraaaaaaac useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaab,"0.0000 TES","1.0000 TES","0.0000 TES","0.0000 TES","0.0000 TES", useraaaaaaah,"abc"]' -p useraaaaaaab useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaaf,"0.0000 TES","1.0000 TES","0.0000 TES","0.0000 TES","0.0000 TES", useraaaaaaah,"小军"]' -p useraaaaaaaf useraaaaaaah
        #cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaac,"0.0000 TES","2.0000 TES","2.0000 TES","2.0000 TES","2.0000 TES", useraaaaaaah,"abc"]' -p useraaaaaaac useraaaaaaah
        #cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaad,"0.0000 TES","100.0000 TES","0.0000 TES","10.0000 TES","10.0000 TES", useraaaaaaah,"cxvx"]' -p useraaaaaaad useraaaaaaah
        
        sleep 36s
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards endbet '['$tableid']' -p useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards verdealeseed '['$tableid',10]' -p useraaaaaaab useraaaaaaah
        sleep 3s
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards verserveseed '['$tableid',704]' -p useraaaaaaah
        cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        cleos get table gamemallards gamemallards shuffleinfo -L $tableid -U $tableid
        
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards shuffle '['$tableid']' -p useraaaaaaah
        cleos get table gamemallards gamemallards shuffleinfo -L $tableid -U $tableid
        cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards edittable '['$tableid', 1,"useraaaaaaaj","TES", "0.8000", "0.3000", "1001.0000 TES","100.0000 TES","100.0000 TES","1.0000 TES","50.0000 TES","1.0000 TES"]' -p useraaaaaaab useraaaaaaah
        cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        
        #cleos --wallet-url http://127.0.0.1:6666 push action gamemallards dealerwitdaw '['$tableid', "2000.0000 TES"]' -p useraaaaaaab
        # cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        
        #cleos --wallet-url http://127.0.0.1:6666 push action gamemallards closetable '['$tableid']' -p useraaaaaaab
        #cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
    ;;
    erasedata)
        #the second parameter is (103718369455 = erase end&&pause|| -2 = erase close)
        echo "erase old data(second parameter is (103718369455 = erase end&&pause|| -2 = erase close)"
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard clear12cache '['$2']' -p useraaaaaaak
    ;;
    importdata)
        echo "importdata test"
        nums=(29 100 13 8 91 44);
        cleos --wallet-url http://127.0.0.1:6666 push action game12lizard import12data '[180,0,"useraaaaaaab","0","0","100.0000 SYS","2.0000 SYS","3.0000 SYS","4.0000 SYS","5.0000 SYS","6.0000 SYS","7.0000 SYS","8.0000 SYS","9.0000 SYS","10.0000 SYS","11.0000 SYS","12.0000 SYS","13.0000 SYS","14.0000 SYS","15.0000 SYS","16.0000 SYS","17.0000 SYS",0.003,0.002,"0",{"symbol":"4,TES","contract":"useraaaaaaaj"}]' -p useraaaaaaak
        #cleos --wallet-url http://127.0.0.1:6666 push action game12lizard import12data '[13,${nums[@]}]' -p useraaaaaaak
    ;;
    shuffle)
        #test shuffle for baccarat
        echo "test shuffle"
        eosio-cpp -abigen gamemallards.cpp -o gamemallards.wasm
        cleos --wallet-url http://127.0.0.1:6666 set contract gamemallards ./ gamemallards.wasm gamemallards.abi
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards newtable '[useraaaaaaab,"23000.0000 SYS", 1, "1.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS"]' -p useraaaaaaab
        tableid=`cleos get table gamemallards gamemallards tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
        
        for((num=1;num<=2;num++));
        do
            cleos --wallet-url http://127.0.0.1:6666 push action gamemallards hashseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5,e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaab useraaaaaaah
            cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaac,"500.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaac useraaaaaaah
            cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaad,"0.0000 SYS","100.0000 SYS","0.0000 SYS","10.0000 SYS","10.0000 SYS"]' -p useraaaaaaad useraaaaaaah
            cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
            sleep 36s
            cleos --wallet-url http://127.0.0.1:6666 push action gamemallards endbet '['$tableid']' -p useraaaaaaah
            cleos --wallet-url http://127.0.0.1:6666 push action gamemallards verdealeseed '['$tableid',10]' -p useraaaaaaab
            sleep 3s
            cleos --wallet-url http://127.0.0.1:6666 push action gamemallards verserveseed '['$tableid',704]' -p useraaaaaaah
            cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        done
    ;;
    
    pausetable)
        #test pausetable for baccarat
        echo "test pausetable continuetable and closetable"
        eosio-cpp -abigen gamemallards.cpp -o gamemallards.wasm
        cleos --wallet-url http://127.0.0.1:6666 set contract gamemallards ./ gamemallards.wasm gamemallards.abi
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards newtable '[useraaaaaaab,"23000.0000 SYS", 1, "0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS"]' -p useraaaaaaab
        tableid=`cleos get table gamemallards gamemallards tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
        cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards pausetable '['$tableid']' -p useraaaaaaab
        cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards hashseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5,e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaab useraaaaaaah
        
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards continuetable '['$tableid']' -p useraaaaaaab
        
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaac,"500.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaac useraaaaaaah
        #cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaad,"0.0000 SYS","100.0000 SYS","0.0000 SYS","10.0000 SYS","10.0000 SYS"]' -p useraaaaaaad useraaaaaaah
        cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        sleep 36s
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards endbet '['$tableid']' -p useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards verdealeseed '['$tableid',10]' -p useraaaaaaab
        sleep 3s
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards verserveseed '['$tableid',704]' -p useraaaaaaah
        cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards closetable '['$tableid']' -p useraaaaaaab
        cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards continuetable '['$tableid']' -p useraaaaaaab
        cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        
    ;;
    normalflow)
        echo "normalflow test"
        eosio-cpp -abigen gamemallards.cpp -o gamemallards.wasm
        cleos --wallet-url http://127.0.0.1:6666 set contract gamemallards ./ gamemallards.wasm gamemallards.abi
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards newtable '[useraaaaaaab,"23000.0000 SYS", 1, "0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS"]' -p useraaaaaaab
        tableid=`cleos get table gamemallards gamemallards tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
        
        #  cleos --wallet-url http://127.0.0.1:6666 push action gamemallards newtable '[useraaaaaaac,"23000.0000 SYS"]' -p useraaaaaaac
        #  cleos --wallet-url http://127.0.0.1:6666 push action gamemallards newtable '[useraaaaaaab,"24202.0000 SYS"]' -p useraaaaaaab
        #second index
        #  cleos get table gamemallards gamemallards tablesinfo --index 2 --key-type name -L useraaaaaaac -U useraaaaaaac
        
        cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token gamemallards
        cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaaab
        cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaaac
        cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaaad
        
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards hashseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5,e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaab useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaac,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaac useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaad,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaad useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaae,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaae useraaaaaaah
        cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        sleep 36s
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards endbet '['$tableid']' -p useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards verdealeseed '['$tableid',10]' -p useraaaaaaab
        sleep 3s
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards verserveseed '['$tableid',704]' -p useraaaaaaah
        cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        sleep 3s
        cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token gamemallards
        cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaaab
        cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaaac
        cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaaad
        sleep 3s
        
    ;;
    trusteeship)
        # start
        
        echo "trusteeship test"
        eosio-cpp -abigen mallard.cpp -o mallard.wasm
        cleos --wallet-url http://127.0.0.1:6666 set contract gamemallards ./ mallard.wasm mallard.abi
        #cleos --wallet-url http://127.0.0.1:6666 push action gamemallards newtable '[useraaaaaaab,"23000.0000 SYS", 1, "0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS"]' -p useraaaaaaab
        #tableid=`cleos get table gamemallards gamemallards tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards newtable '[202,useraaaaaaab,"4000.0000 TES", 1,"useraaaaaaaj","TES", "0.005", "0.002", "5.0000 TES","1.0000 TES","5.0000 TES","1.0000 TES","5.0000 TES","1.0000 TES"]' -p useraaaaaaab useraaaaaaah
        tableid=`cleos get table gamemallards gamemallards tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards shuffle '['$tableid']' -p useraaaaaaah
        
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards upgrading '["1"]' -p useraaaaaaak
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards trusteeship '['$tableid']' -p useraaaaaaab useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards exitruteship '['$tableid']' -p useraaaaaaab useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards dealerseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5]' -p useraaaaaaab useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards serverseed '['$tableid',e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaah
        cleos get table gamemallards gamemallards shuffleinfo -L $tableid -U $tableid
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaac,"0.0000 TES","2.0000 TES","2.0000 TES","2.0000 TES","2.0000 TES", "wangls", "王帅"]' -p useraaaaaaac useraaaaaaah
        cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        sleep 36s
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards endbet '['$tableid']' -p useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards verdealeseed '['$tableid',10]' -p useraaaaaaab useraaaaaaah
        sleep 3s
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards verserveseed '['$tableid',704]' -p useraaaaaaah
        cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        sleep 3s
    ;;
    exitruteship)
        echo "exitruteship test"
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards newtable '[useraaaaaaab,"23000.0000 SYS"]' -p useraaaaaaab
        tableid=`cleos get table gamemallards gamemallards tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
        
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards exitruteship '['$tableid']' -p useraaaaaaab
        for((num=1;num<=1;num++));
        do
            echo "this roundId: $num"
            cleos --wallet-url http://127.0.0.1:6666 push action gamemallards hashseed '['$tableid',9d8cc53ec9a3db76af85145d224201054044d56158d8f6186ea8cc22f3b2f4dd,a2829e4ffc37947dc9172cd3aeb6a1f19bf6bf27ea0abe2c527884620614eff3]' -p useraaaaaaab useraaaaaaah
            cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaac,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaac useraaaaaaah
            cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaad,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaad useraaaaaaah
            cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaae,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaae useraaaaaaah
            cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
            sleep 36s
            cleos --wallet-url http://127.0.0.1:6666 push action gamemallards endbet '['$tableid']' -p useraaaaaaah
            cleos --wallet-url http://127.0.0.1:6666 push action gamemallards verdealeseed '['$tableid',1w1]' -p useraaaaaaab
            sleep 3s
            cleos --wallet-url http://127.0.0.1:6666 push action gamemallards verserveseed '['$tableid',2l3wxx2]' -p useraaaaaaah
            cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
            sleep 3s
        done
    ;;
    disconnect)
        echo "dealer disconnect test"
        tableid=`cleos get table gamemallards gamemallards tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
        
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards exitruteship '['$tableid']' -p useraaaaaaab
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards hashseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5,e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaab useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaac,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaac useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaad,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaad useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards playerbet '['$tableid',useraaaaaaae,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaae useraaaaaaah
        cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        sleep 36s
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards endbet '['$tableid']' -p useraaaaaaah
        # cleos --wallet-url http://127.0.0.1:6666 push action gamemallards verdealeseed '['$tableid',"10"]' -p useraaaaaaab
        sleep 3s
        cleos --wallet-url http://127.0.0.1:6666 push action gamemallards verserveseed '['$tableid',"704"]' -p useraaaaaaah
        cleos get table gamemallards gamemallards tablesinfo -L $tableid -U $tableid
        sleep 3s
    ;;
esac









