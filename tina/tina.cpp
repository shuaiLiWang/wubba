#include "tina.hpp"

ACTION tina::erasingdata(uint64_t key)
{
    require_auth(_self);
    if (key == -1)
    {
        auto itr = tinatable.begin();
        while (itr != tinatable.end())
        {
            eosio::print(" Removing data ", _self, ", key: ", key, ", itr: ", itr->balance);
            itr = tinatable.erase(itr);
        }
    }
    else
    {
        auto itr = tinatable.find(key);
        tinatable.erase(itr);
    }
}

ACTION tina::testmultidex(asset money)
{
    string seed = "10";
    // eosio::print(" seed.substr(0,1)  : ", seed.substr(0, 1));
    // eosio::print(" seed.substr(1,2)  : ", seed.substr(1, 2));
    eosio::checksum256 result = sha256(seed.c_str(), seed.size());
    eosio::print(" result : ", result);
    auto hash_data = result.extract_as_byte_array();
    string result_str = to_hex(reinterpret_cast<const char *>(hash_data.data()), 32);
    eosio::print(" hash_data : ", result_str);
    // auto counter = 0;
    // for (auto w_itr = hash_data.begin(); w_itr != hash_data.end(); ++counter, ++w_itr)
    // {
    //     eosio::print(" ", counter, " : [", string((char *)w_itr), "]");
    // }
    // eosio::print(" testtransfer : ", money);
    // INLINE_ACTION_SENDER(eosio::token, transfer)
    // (
    //     "eosio.token"_n, {{owner, "active"_n}},
    //     {owner, accounta, money, money.to_string()});
    // tinatable.emplace(_self, [&](auto &s) {
    //     s.id = tinatable.available_primary_key();
    //     s.balance = money;
    // });
}

ACTION tina::testdispatch()
{
    auto money = asset(10000, symbol(symbol_code("SYS"), 4)); // money = 1.0000 SYS
    eosio::print(" testtransfer : ", money);
    INLINE_ACTION_SENDER(eosio::token, transfer)
    (
        "eosio.token"_n, {{owner, "active"_n}},
        {owner, accounta, money, money.to_string()});
}

ACTION tina::testtransfer(asset money)
{
    eosio::print(" testtransfer : ", money);
    INLINE_ACTION_SENDER(eosio::token, transfer)
    (
        "eosio.token"_n, {{owner, "active"_n}},
        {owner, accounta, money, std::string("money ")});
}

ACTION tina::testreverse(asset money)
{
    eosio::print(" testreverse : ", money);
    INLINE_ACTION_SENDER(eosio::token, transfer)
    (
        "eosio.token"_n, {{accounta, "active"_n}},
        {accounta, owner, money, std::string("money ")});
}

ACTION tina::testaccount(asset money)
{
    eosio::print(" testaccount : ", money);
    INLINE_ACTION_SENDER(eosio::token, transfer)
    (
        "eosio.token"_n, {{accounta, "active"_n}},
        {accounta, accountb, money, std::string("money ")});
}

EOSIO_DISPATCH(tina, (erasingdata)(testmultidex)(testdispatch)(testtransfer)(testreverse)(testaccount))
