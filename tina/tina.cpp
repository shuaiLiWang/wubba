#include "tina.hpp"
#include "eosio.token.hpp"
ACTION tina::testtransfer(asset money)
{
    print_f("testtransfer : %\n", money);
    INLINE_ACTION_SENDER(eosio::token, transfer)
    (
        "eosio.token"_n, {{owner, "active"_n}},
        {owner, accounta, money, std::string("money ")});
}

ACTION tina::testreverse(asset money)
{
    print_f("testreverse : %\n", money);
    INLINE_ACTION_SENDER(eosio::token, transfer)
    (
        "eosio.token"_n, {{accounta, "active"_n}},
        {accounta, owner, money, std::string("money ")});
}

ACTION tina::testaccount(asset money)
{
    print_f("testaccount : %\n", money);
    INLINE_ACTION_SENDER(eosio::token, transfer)
    (
        "eosio.token"_n, {{accounta, "active"_n}},
        {accounta, accountb, money, std::string("money ")});
}

EOSIO_DISPATCH(tina, (testtransfer)(testreverse)(testaccount))