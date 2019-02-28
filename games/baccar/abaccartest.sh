#!/bin/bash

case $1 in
chainstart)
    echo "chain restart, set permission"
    cleos --wallet-url http://127.0.0.1:6666 system newaccount useraaaaaaak gamebaccarat EOS8Znrtgwt8TfpmbVpTKvA2oB8Nqey625CLN8bCN3TEbgx86Dsvr --buy-ram "100 SYS" --stake-net "100 SYS" --stake-cpu "100 SYS" --transfer
    cleos --wallet-url http://127.0.0.1:6666 transfer useraaaaaaam gamebaccarat "100000 SYS"
    cleos --wallet-url http://127.0.0.1:6666 set account permission useraaaaaaab active '{"threshold":1,"keys":[{"key":"EOS7yBtksm8Kkg85r4in4uCbfN77uRwe82apM8jjbhFVDgEgz3w8S","weight":1}],"accounts":[{"permission":{"actor":"gamebaccarat","permission":"eosio.code"},"weight":1}]}' owner -p useraaaaaaab
    cleos --wallet-url http://127.0.0.1:6666 set account permission useraaaaaaac active '{"threshold":1,"keys":[{"key":"EOS7WnhaKwHpbSidYuh2DF1qAExTRUtPEdZCaZqt75cKcixuQUtdA","weight":1}],"accounts":[{"permission":{"actor":"gamebaccarat","permission":"eosio.code"},"weight":1}]}' owner -p useraaaaaaac
    cleos --wallet-url http://127.0.0.1:6666 set account permission useraaaaaaad active '{"threshold":1,"keys":[{"key":"EOS7Bn1YDeZ18w2N9DU4KAJxZDt6hk3L7eUwFRAc1hb5bp6xJwxNV","weight":1}],"accounts":[{"permission":{"actor":"gamebaccarat","permission":"eosio.code"},"weight":1}]}' owner -p useraaaaaaad
    cleos --wallet-url http://127.0.0.1:6666 set account permission useraaaaaaae active '{"threshold":1,"keys":[{"key":"EOS7Bn1YDeZ18w2N9DU4KAJxZDt6hk3L7eUwFRAc1hb5bp6xJwxNV","weight":1}],"accounts":[{"permission":{"actor":"gamebaccarat","permission":"eosio.code"},"weight":1}]}' owner -p useraaaaaaae
    cleos --wallet-url http://127.0.0.1:6666 set account permission gamebaccarat active '{"threshold":1,"keys":[{"key":"EOS69X3383RzBZj41k73CSjUNXM5MYGpnDxyPnWUKPEtYQmTBWz4D","weight":1}],"accounts":[{"permission":{"actor":"gamebaccarat","permission":"eosio.code"},"weight":1}]}' owner -p gamebaccarat
    ;;

temptest)
    #test shuffle for baccarat
    echo "temptest"
    eosio-cpp -abigen gamebaccarat.cpp -o gamebaccarat.wasm
    cleos --wallet-url http://127.0.0.1:6666 set contract gamebaccarat ./ gamebaccarat.wasm gamebaccarat.abi
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat newtable '[useraaaaaaab,"23000.0000 SYS", 1, "1001.0000 SYS","100.0000 SYS","100.0000 SYS","1.0000 SYS","50.0000 SYS","1.0000 SYS"]' -p useraaaaaaab
    tableid=`cleos get table gamebaccarat gamebaccarat tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`

    for((num=1;num<=1;num++));
    do
        cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid
        cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat dealerseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5]' -p useraaaaaaab
        cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid
    done

    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat depositable '[useraaaaaaab, '$tableid', "23000.0000 SYS"]' -p useraaaaaaab
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid

    sleep 3s
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat dealerseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5]' -p useraaaaaaab
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat serverseed '['$tableid',e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaah
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaac,"0.0000 SYS","200.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaac useraaaaaaah
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaad,"0.0000 SYS","100.0000 SYS","0.0000 SYS","10.0000 SYS","10.0000 SYS"]' -p useraaaaaaad useraaaaaaah
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid
    sleep 36s
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat endbet '['$tableid']' -p useraaaaaaah
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat verdealeseed '['$tableid',10]' -p useraaaaaaab
    sleep 3s
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat verserveseed '['$tableid',704]' -p useraaaaaaah
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid

    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat dealerwitdaw '['$tableid', "2000.0000 SYS"]' -p useraaaaaaab
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid

    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat closetable '['$tableid']' -p useraaaaaaab
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid

    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat changeprivat '[0, '$tableid']' -p useraaaaaaab
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid

    ;;

shuffle)
    #test shuffle for baccarat
    echo "test shuffle"
    eosio-cpp -abigen gamebaccarat.cpp -o gamebaccarat.wasm
    cleos --wallet-url http://127.0.0.1:6666 set contract gamebaccarat ./ gamebaccarat.wasm gamebaccarat.abi
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat newtable '[useraaaaaaab,"23000.0000 SYS", 1, "1.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS"]' -p useraaaaaaab
    tableid=`cleos get table gamebaccarat gamebaccarat tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`

    for((num=1;num<=2;num++));
    do
        cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat dealerseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5]' -p useraaaaaaab
        cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat serverseed '['$tableid',e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaac,"500.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaac useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaad,"0.0000 SYS","100.0000 SYS","0.0000 SYS","10.0000 SYS","10.0000 SYS"]' -p useraaaaaaad useraaaaaaah
        cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid
        sleep 36s
        cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat endbet '['$tableid']' -p useraaaaaaah
        cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat verdealeseed '['$tableid',10]' -p useraaaaaaab
        sleep 3s
        cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat verserveseed '['$tableid',704]' -p useraaaaaaah
        cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid
    done
    ;;

pausetable)
    #test pausetable for baccarat
    echo "test pausetable continuetable and closetable"
    eosio-cpp -abigen gamebaccarat.cpp -o gamebaccarat.wasm
    cleos --wallet-url http://127.0.0.1:6666 set contract gamebaccarat ./ gamebaccarat.wasm gamebaccarat.abi
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat newtable '[useraaaaaaab,"23000.0000 SYS", 1, "0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS"]' -p useraaaaaaab
    tableid=`cleos get table gamebaccarat gamebaccarat tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid

    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat pausetable '['$tableid']' -p useraaaaaaab
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat dealerseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5]' -p useraaaaaaab

    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat continuetable '['$tableid']' -p useraaaaaaab
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat dealerseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5]' -p useraaaaaaab

    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat serverseed '['$tableid',e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaah
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaac,"500.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaac useraaaaaaah
    #cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaad,"0.0000 SYS","100.0000 SYS","0.0000 SYS","10.0000 SYS","10.0000 SYS"]' -p useraaaaaaad useraaaaaaah
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid
    sleep 36s
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat endbet '['$tableid']' -p useraaaaaaah
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat verdealeseed '['$tableid',10]' -p useraaaaaaab
    sleep 3s
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat verserveseed '['$tableid',704]' -p useraaaaaaah
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid

    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat closetable '['$tableid']' -p useraaaaaaab
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid

    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat continuetable '['$tableid']' -p useraaaaaaab
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid

    ;;
erasedata)
    #the second parameter is (-1 = erase all|| -2 = erase close||num)
    echo "erase old data(the second parameter is (-1 = erase all|| -2 = erase close||num))"
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat erasingdata '['$2']' -p gamebaccarat
    ;;
normalflow)
    echo "normalflow test"
    eosio-cpp -abigen gamebaccarat.cpp -o gamebaccarat.wasm
    cleos --wallet-url http://127.0.0.1:6666 set contract gamebaccarat ./ gamebaccarat.wasm gamebaccarat.abi
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat newtable '[useraaaaaaab,"23000.0000 SYS", 1, "0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS"]' -p useraaaaaaab
    tableid=`cleos get table gamebaccarat gamebaccarat tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`

  #  cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat newtable '[useraaaaaaac,"23000.0000 SYS"]' -p useraaaaaaac
  #  cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat newtable '[useraaaaaaab,"24202.0000 SYS"]' -p useraaaaaaab
    #second index
  #  cleos get table gamebaccarat gamebaccarat tablesinfo --index 2 --key-type name -L useraaaaaaac -U useraaaaaaac

    cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token gamebaccarat
    cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaaab
    cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaaac
    cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaaad

    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat dealerseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5]' -p useraaaaaaab
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat serverseed '['$tableid',e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaah
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaac,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaac useraaaaaaah
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaad,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaad useraaaaaaah
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaae,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaae useraaaaaaah
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid
    sleep 36s
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat endbet '['$tableid']' -p useraaaaaaah
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat verdealeseed '['$tableid',10]' -p useraaaaaaab
    sleep 3s
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat verserveseed '['$tableid',704]' -p useraaaaaaah
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid
    sleep 3s
    cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token gamebaccarat
    cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaaab
    cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaaac
    cleos --wallet-url http://127.0.0.1:6666 get currency balance eosio.token useraaaaaaad
    sleep 3s

    ;;
trusteeship)
    # start

    echo "trusteeship test"
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat newtable '[useraaaaaaab,"23000.0000 SYS", 1, "0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS","0.0000 SYS"]' -p useraaaaaaab
    tableid=`cleos get table gamebaccarat gamebaccarat tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`

    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat trusteeship '['$tableid']' -p useraaaaaaab
    # cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat dealerseed '['$tableid',9d8cc53ec9a3db76af85145d224201054044d56158d8f6186ea8cc22f3b2f4dd]' -p useraaaaaaab
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat serverseed '['$tableid',a2829e4ffc37947dc9172cd3aeb6a1f19bf6bf27ea0abe2c527884620614eff3]' -p useraaaaaaah
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaac,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaac useraaaaaaah
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaad,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaad useraaaaaaah
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaae,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaae useraaaaaaah
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid
    sleep 36s
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat endbet '['$tableid']' -p useraaaaaaah
    # cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat verdealeseed '['$tableid',"1w1"]' -p useraaaaaaab
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat verserveseed '['$tableid',"2l3wxx2"]' -p useraaaaaaah
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid
    sleep 3s
    ;;
exitruteship)
    echo "exitruteship test"
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat newtable '[useraaaaaaab,"23000.0000 SYS"]' -p useraaaaaaab
    tableid=`cleos get table gamebaccarat gamebaccarat tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`

    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat exitruteship '['$tableid']' -p useraaaaaaab
    for((num=1;num<=1;num++));
    do
    	echo "this roundId: $num"
    	cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat dealerseed '['$tableid',9d8cc53ec9a3db76af85145d224201054044d56158d8f6186ea8cc22f3b2f4dd]' -p useraaaaaaab
    	cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat serverseed '['$tableid',a2829e4ffc37947dc9172cd3aeb6a1f19bf6bf27ea0abe2c527884620614eff3]' -p useraaaaaaah
    	cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaac,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaac useraaaaaaah
    	cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaad,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaad useraaaaaaah
    	cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaae,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaae useraaaaaaah
    	cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid
    	sleep 36s
    	cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat endbet '['$tableid']' -p useraaaaaaah
    	cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat verdealeseed '['$tableid',1w1]' -p useraaaaaaab
    	sleep 3s
    	cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat verserveseed '['$tableid',2l3wxx2]' -p useraaaaaaah
    	cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid
    	sleep 3s
    done
    ;;
disconnect)
    echo "dealer disconnect test"
    tableid=`cleos get table gamebaccarat gamebaccarat tablesinfo -l 100|grep tableId|awk -F' ' 'END {print $NF}' |awk -F ',' '{print $1}'`

    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat exitruteship '['$tableid']' -p useraaaaaaab
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat dealerseed '['$tableid',4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5]' -p useraaaaaaab
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat serverseed '['$tableid',e4e549408422875958476160732390defefcac7c2bd8353d918fe452d20de2a6]' -p useraaaaaaah
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaac,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaac useraaaaaaah
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaad,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaad useraaaaaaah
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat playerbet '['$tableid',useraaaaaaae,"200.0000 SYS","0.0000 SYS","3.0000 SYS","4.0000 SYS","3.0000 SYS"]' -p useraaaaaaae useraaaaaaah
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid
    sleep 36s
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat endbet '['$tableid']' -p useraaaaaaah
    # cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat verdealeseed '['$tableid',"10"]' -p useraaaaaaab
    sleep 3s
    cleos --wallet-url http://127.0.0.1:6666 push action gamebaccarat verserveseed '['$tableid',"704"]' -p useraaaaaaah
    cleos get table gamebaccarat gamebaccarat tablesinfo -L $tableid -U $tableid
    sleep 3s
    ;;
esac








