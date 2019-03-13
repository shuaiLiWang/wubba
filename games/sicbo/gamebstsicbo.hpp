#pragma once

#include <eosiolib/transaction.hpp>
#include <eosiolib/permission.hpp>
#include <eosiolib/crypto.hpp>
#include "../../chain/eosio.token.hpp"
#include <cmath>


using namespace eosio;
using namespace std;
using std::string;

CONTRACT gamebstsicbo : public contract
{
  public:
    using contract::contract;

    gamebstsicbo(name receiver, name code, datastream<const char *> ds)
        : contract(receiver, code, ds), tableround(receiver, receiver.value) {}

    ACTION newtable(name dealer, asset deposit, bool isPrivate, name code, string sym, asset oneRoundMaxTotalBet_bsoe, asset minPerBet_bsoe , asset oneRoundMaxTotalBet_anytri, asset minPerBet_anytri
            , asset oneRoundMaxTotalBet_trinum, asset minPerBet_trinum, asset oneRoundMaxTotalBet_pairnum, asset minPerBet_pairnum, asset oneRoundMaxTotalBet_txx, asset minPerBet_txx
            , asset oneRoundMaxTotalBet_twocom, asset minPerBet_twocom, asset oneRoundMaxTotalBet_single, asset minPerBet_single);
    ACTION dealerseed(uint64_t tableId, checksum256 encodeSeed);
    ACTION serverseed(uint64_t tableId, checksum256 encodeSeed);
    ACTION endbet(uint64_t tableId);
    ACTION playerbet(uint64_t tableId, name player, string bet);
    ACTION verdealeseed(uint64_t tableId, string seed);
    ACTION verserveseed(uint64_t tableId, string seed);
    ACTION trusteeship(uint64_t tableId);
    ACTION exitruteship(uint64_t tableId);
    ACTION disconnecthi(name informed, uint64_t tableId);
    ACTION erasingdata(uint64_t key);
    ACTION pausetabledea(uint64_t tableId);
    ACTION pausetablesee(uint64_t tableId);
    ACTION continuetable(uint64_t tableId);
    ACTION closetable(uint64_t tableId);
    ACTION depositable(name dealer, uint64_t tableId, asset deposit);
    ACTION dealerwitdaw(uint64_t tableId, asset withdraw);
    ACTION changeprivat(bool isPrivate, uint64_t tableId);

    struct player_bet_info
    {
        name player;
        string bet;
        asset pBonus;
        asset dBonus;

        EOSLIB_SERIALIZE(player_bet_info, (player)(bet)(pBonus)(dBonus))
    };

    struct bet_info
    {
        string name;
        asset amont;

        EOSLIB_SERIALIZE(bet_info, (name)(amont))
    };

    struct sym_info
    {
        uint16_t id;
        name code;
        symbol symName;

        EOSLIB_SERIALIZE(sym_info, (id)(code)(symName))
    };

    TABLE table_stats
    {
        // ------------------------------ table field ------------------------------
        uint64_t tableId;                   // table fix.
        name dealer;                        // table owner.
        bool trusteeship;                   // table flag.
        bool isPrivate;                     // table flag.
        asset dealerBalance;                // table filed.
        asset oneRoundMaxTotalBet_bsoe;
        asset minPerBet_bsoe;
        asset oneRoundMaxTotalBet_anytri;
        asset minPerBet_anytri;
        asset oneRoundMaxTotalBet_trinum;
        asset minPerBet_trinum;
        asset oneRoundMaxTotalBet_pairnum;
        asset minPerBet_pairnum;
        asset oneRoundMaxTotalBet_txx;
        asset minPerBet_txx;
        asset oneRoundMaxTotalBet_twocom;
        asset minPerBet_twocom;
        asset oneRoundMaxTotalBet_single;
        asset minPerBet_single;

        asset oneRoundDealerMaxPay;
        asset minTableDeposit;
        symbol amontSymbol;
            // ------------------------------ round field ------------------------------
        uint64_t betStartTime; // for keeping bet stage/round.
        uint64_t tableStatus;  // round stage.
        asset currRoundBetSum_bsoe;
        asset currRoundBetSum_anytri;
        asset currRoundBetSum_trinum;
        asset currRoundBetSum_pairnum;
        asset currRoundBetSum_txx;
        asset currRoundBetSum_twocom;
        asset currRoundBetSum_single;

        checksum256 dealerSeedHash;
        checksum256 serverSeedHash;
        string dealerSeed;
        string serverSeed;
        bool dSeedVerity;
        bool sSeedVerity;

        std::vector<player_bet_info> playerInfo;

        string roundResult;
        string diceResult;

        uint64_t primary_key() const { return tableId; }
        uint64_t get_dealer() const { return dealer.value; }

        enum class status_fields : uint64_t
        {
            ROUND_START = 1,
            ROUND_BET = 2,
            ROUND_REVEAL = 4,
            ROUND_END = 0,
            PAUSED = 3, // must be changed under ROUND_END status.
            CLOSED = 5
        };
        EOSLIB_SERIALIZE(table_stats, (tableId)(dealer)(trusteeship)(isPrivate)(dealerBalance)(oneRoundMaxTotalBet_bsoe)(minPerBet_bsoe)(oneRoundMaxTotalBet_anytri)(minPerBet_anytri)(oneRoundMaxTotalBet_trinum)(minPerBet_trinum)(oneRoundMaxTotalBet_pairnum)(minPerBet_pairnum)(oneRoundMaxTotalBet_txx)(minPerBet_txx)(oneRoundMaxTotalBet_twocom)(minPerBet_twocom)(oneRoundMaxTotalBet_single)(minPerBet_single)(oneRoundDealerMaxPay)(minTableDeposit)(amontSymbol)(betStartTime)(tableStatus)(currRoundBetSum_bsoe)(currRoundBetSum_anytri)(currRoundBetSum_trinum)(currRoundBetSum_pairnum)(currRoundBetSum_txx)(currRoundBetSum_twocom)(currRoundBetSum_single)(dealerSeedHash)(serverSeedHash)(dealerSeed)(serverSeed)(dSeedVerity)(sSeedVerity)(playerInfo)(roundResult)(diceResult))
    };

    typedef eosio::multi_index<"tablesinfo"_n, gamebstsicbo::table_stats, indexed_by<"dealer"_n, const_mem_fun<gamebstsicbo::table_stats, uint64_t, &gamebstsicbo::table_stats::get_dealer>>> singletable_t;
    // std random
    struct WBRNG
    {
        unsigned long next;
        void srand(unsigned int seed)
        {
            next = seed;
        }
        int rand()
        {
            next = next * 1103515245 + 12345;
            return (unsigned int)(next / 65536) % 32768;
        }
    };
    // char to int:string hash function. SDBMHash
    unsigned int SDBMHash(char *str)
    {
        unsigned int hash = 0;
        while (*str)
        {
            // equivalent to: hash = 65599*hash + (*str++);
            hash = (*str++) + (hash << 6) + (hash << 16) - hash;
        }
        return (hash & 0x7FFFFFFF);
    }
    // 32 char to hex:64 string
    string to_hex_w(const char *d, uint32_t s)
    {
        std::string r;
        const char *to_hex = "0123456789abcdef";
        uint8_t *c = (uint8_t *)d;
        for (uint32_t i = 0; i < s; ++i)
            (r += to_hex[(c[i] >> 4)]) += to_hex[(c[i] & 0x0f)];
        return r;
    }

    asset from_string(string from, symbol sym)
    {
        string s = trim(from);
        auto space_pos = s.find(' ');
        eosio_assert(space_pos != string::npos, "Asset's amont and symbol should be separated with space");
        string symbol_str = trim(s.substr(space_pos + 1));
        eosio_assert(symbol_str == sym.code().to_string(), "Asset's symbol is not match!");
        auto amont_str = s.substr(0, space_pos);
        auto amont = Atof(amont_str.c_str());
        amont *= pow(10, int64_t(sym.precision()));
        return asset((int)amont, sym);
    }

    string trim(string s)
    {
        if (s.empty())
        {
            return s;
        }

        s.erase(0, s.find_first_not_of(" "));
        s.erase(s.find_last_not_of(" ") + 1);
        return s;
    }

    double Atof(const char *pstr)
    {
        double sign = 1.0;
        double num1 = 0.0;
        double num2 = 0.0;
        double point = 0.1;

        while (*pstr == ' ' || *pstr == '\t')
        {
            pstr++;
        }

        if (*pstr == '-')
        {
            sign = -1;
            pstr++;
        }

        while (*pstr)
        {
            if (*pstr == '.')
            {
                pstr++;
                while (*pstr >= '0' && *pstr <= '9')
                {
                    num1 += point * (*pstr - '0');
                    point *= 0.1;
                    pstr++;
                }
            }
            else if (*pstr >= '0' && *pstr <= '9')
            {
                num2 = num2 * 10 + *pstr -'0';
            }
            else
            {
                return (num1 + num2) * (sign);
            }
            pstr++;
        }
        return (num1 + num2) * (sign);
    }


    bool checkBetOptions(string bet, symbol sym, asset &betAmont, std::vector<bet_info> &betVec)
    {
        bool result = false;

        auto pos = bet.find(":");
        auto pos_end = 0;
        while (pos!=string::npos)
        {
            string temp_name = bet.substr(pos_end + 2, pos - pos_end - 3);
            result = false;
            for(auto j : gamebstsicbo::betOptions)
            {
                if(j == temp_name)
                {
                    result = true;
                }
            }

            if(!result)
                return result;

            eosio::print("temp_name:", temp_name, " ...");
            pos_end = bet.find(",",pos);
            string temp_amont;
            if(pos_end != -1)
            {
                temp_amont = bet.substr(pos + 3, pos_end - pos - 4);
            }
            else
            {
                pos_end = bet.find("}",pos);
                temp_amont = bet.substr(pos + 3, pos_end - pos - 4);
            }
            eosio::print("temp_amont:", temp_amont, " ...");
            //symbol sysDefault = symbol(symbol_code(sym), 4);
            auto amont = from_string(temp_amont, sym);
            eosio::print("temp_amont to int:", amont, " ...");
            betAmont += amont;
            bet_info bet_info_temp;
            bet_info_temp.name = temp_name;
            bet_info_temp.amont = amont;
            betVec.emplace_back(bet_info_temp);
            pos = bet.find(":", pos_end);
        }
        return result;
    }

    using newtable_action = action_wrapper<"newtable"_n, &gamebstsicbo::newtable>;
    using dealerseed_action = action_wrapper<"dealerseed"_n, &gamebstsicbo::dealerseed>;
    using serverseed_action = action_wrapper<"serverseed"_n, &gamebstsicbo::serverseed>;
    using playerbet_action = action_wrapper<"playerbet"_n, &gamebstsicbo::playerbet>;
    using endbet_action = action_wrapper<"endbet"_n, &gamebstsicbo::endbet>;
    using verdealeseed_action = action_wrapper<"verdealeseed"_n, &gamebstsicbo::verdealeseed>;
    using verserveseed_action = action_wrapper<"verserveseed"_n, &gamebstsicbo::verserveseed>;
    using trusteeship_action = action_wrapper<"trusteeship"_n, &gamebstsicbo::trusteeship>;
    using exitruteship_action = action_wrapper<"exitruteship"_n, &gamebstsicbo::exitruteship>;
    using disconnecthi_action = action_wrapper<"disconnecthi"_n, &gamebstsicbo::disconnecthi>;
    using erasingdata_action = action_wrapper<"erasingdata"_n, &gamebstsicbo::erasingdata>;
    using pausetabledea_action = action_wrapper<"pausetabledea"_n, &gamebstsicbo::pausetabledea>;
    using pausetableser_action = action_wrapper<"pausetablesee"_n, &gamebstsicbo::pausetablesee>;
    using continuetable_action = action_wrapper<"continuetable"_n, &gamebstsicbo::continuetable>;
    using closetable_action = action_wrapper<"closetable"_n, &gamebstsicbo::closetable>;
    using depositable_action = action_wrapper<"depositable"_n, &gamebstsicbo::depositable>;
    using dealerwitdaw_action = action_wrapper<"dealerwitdaw"_n, &gamebstsicbo::dealerwitdaw>;
    using changeprivat_action = action_wrapper<"changeprivat"_n, &gamebstsicbo::changeprivat>;

    name serveraccount = "useraaaaaaah"_n;
    name platfrmacnt = "useraaaaaaah"_n; // platform commission account.

    const uint32_t betPeriod = 30;
    const uint32_t minTableRounds = 2;

    static std::vector<sym_info> createSymOptions()
    {
        std::vector<sym_info> tempSym;

        sym_info sym_temp;
        sym_temp.id = 0;
        sym_temp.code = "eosio.token"_n;
        sym_temp.symName = symbol(symbol_code("SYS"), 4);;
        tempSym.emplace_back(sym_temp);

        sym_temp.id = 1;
        sym_temp.code = "eosio"_n;
        sym_temp.symName = symbol(symbol_code("EOS"), 4);;
        tempSym.emplace_back(sym_temp);

        return tempSym;
    }

    static std::vector<string> createBetOptions()
    {
        std::vector<string> tempName;

        tempName.emplace_back("big");
        tempName.emplace_back("small");
        tempName.emplace_back("odd");
        tempName.emplace_back("even");
        tempName.emplace_back("anytri");
        auto count = 1;
        while(count <= 6)
        {
            string tri_name = "tri";
            string pair_name = "pair";
            string signal_name = "s";
            char itc[3];
            sprintf(itc,"%d",count);
            tri_name += itc;
            pair_name += itc;
            signal_name += itc;
            //eosio::print("tri_name:", tri_name, " pair_name:", pair_name, " signal_name:", signal_name, " !");
            tempName.emplace_back(tri_name);
            tempName.emplace_back(pair_name);
            tempName.emplace_back(signal_name);
            count ++;
        }

        count = 4;
        while(count <= 17)
        {
            string total_name = "total";
            char itc[3];
            sprintf(itc,"%d",count);
            total_name += itc;
            tempName.emplace_back(total_name);
            count ++;
        }

        count = 1;
        for(; count <= 5; count ++)
        {
            auto j = count + 1;
            while(j <= 6)
            {
                string com_name = "c";
                char itc[3];
                sprintf(itc,"%d%d",count,j);
                com_name += itc;
                tempName.emplace_back(com_name);
                j++;
            }
        }

        return tempName;
    };

    static const std::vector<string> betOptions;
    static const std::vector<sym_info> symOptions;

    const char *notableerr = "TableId isn't existing!";

    singletable_t tableround;
    WBRNG wbrng;
};
const std::vector<string> gamebstsicbo::betOptions = gamebstsicbo::createBetOptions();
const std::vector<gamebstsicbo::sym_info> gamebstsicbo::symOptions = gamebstsicbo::createSymOptions();