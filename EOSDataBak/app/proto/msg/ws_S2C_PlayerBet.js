/**
 * Created by ujInfo on 2019/4/21.
 */

var ByteBuffer = require('../../../libs/proto/ByteBuffer.js');
var Msg = require('../../../libs/proto/Msg.js');



function ws_S2C_PlayerBet(){
	this.MsgID = 20015;
	this.eosaccount = '';
	this.TableID = 0;
	this.Status = '';

}

ws_S2C_PlayerBet.prototype.encode = function(){
    var buff = new ByteBuffer();
	Msg.encode(buff, 'ushort', this.MsgID);
	Msg.encode(buff, 'string', this.eosaccount);
	Msg.encode(buff, 'int32', this.TableID);
	Msg.encode(buff, 'string', this.Status);

    var result = buff.pack();
    buff = null;
    return result;
}

ws_S2C_PlayerBet.prototype.decode = function(ba){
    var buff = new ByteBuffer(ba);
	this.MsgID = Msg.decode(buff, 'ushort');
	this.eosaccount = Msg.decode(buff, 'string');
	this.TableID = Msg.decode(buff, 'int32');
	this.Status = Msg.decode(buff, 'string');

    buff = null;
}


module.exports = ws_S2C_PlayerBet;