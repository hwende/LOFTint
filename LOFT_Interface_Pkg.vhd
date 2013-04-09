library ieee;
use ieee.std_logic_1164.all;





--------------------------------------------------------------------------------
-- P A C K A G E
--------------------------------------------------------------------------------
package LOFT_Interface_Pkg is

	------------------------------------------------------------------------
	-- PACKET SIZES
	------------------------------------------------------------------------

	constant EVENT_SIZE              : integer          := 32;
	constant COMM_SIZE               : integer          :=  8;
	constant PACKET_SIZE             : integer          := 40;

	------------------------------------------------------------------------
	-- PACKETS
	------------------------------------------------------------------------

	-- MBEE -> PBEE DATA starts with 0000
	constant HEADER_MBEEE            : std_logic_vector := "0000";
	constant HEADER_MBEE_EVENT       : std_logic_vector := "00000001"; -- mbee header example (standard event)
	constant HEADER_MBEE_DUMMY       : std_logic_vector := "00000010"; -- mbee header example (standard event)
	constant PACKET_MBEE_DUMMY       : std_logic_vector := "0000001000000000000000001111111111111111"; -- mbee header example (standard event)
	constant HEADER_MBEE_FIRE        : std_logic_vector := "00001111"; -- mbee header example (mbee is on fire)

	-- PBEE -> MBEE DATA starts with 0001
	constant HEADER_PBEE             : std_logic_vector := "0001";
	constant HEADER_PBEE_CONFIG_STOR : std_logic_vector := "00010001"; -- pbee header example (following packets contain full set of configuration data)
	constant HEADER_PBEE_DATA        : std_logic_vector := "00010010"; -- pbee header example (configuration data)
	constant HEADER_PBEE_FIRE        : std_logic_vector := "00011111"; -- pbee header example (pbee is on fire)

	-- MBEE packets start with 100
	constant MBEE_ACK                : std_logic_vector := "1000000000000000000000001111111111111111";
	constant ERROR_MBEE_TIMEOUT      : std_logic_vector := "1000000100000000000000000000000000000000";
	constant ERROR_MBEE_PARITY       : std_logic_vector := "1000001100000000000000000000000000000000";
	constant ERROR_MBEE_DATA         : std_logic_vector := "1000011100000000000000000000000000000000";

	-- PBEE packets start with 110
	constant PBEE_ACK                : std_logic_vector := "1100000011111111111111110000000000000001";
	constant PBEE_ERROR_PARITY       : std_logic_vector := "1100000111111111111111111111111111111111";
	constant PBEE_ERROR_PROTOCOL     : std_logic_vector := "1100001111111111111111111111111111111111";
	constant PBEE_ERROR_TIMEOUT_FIFO : std_logic_vector := "1100011111111111111111111111111111111111";
	constant PBEE_ERROR_TIMEOUT_MBEE : std_logic_vector := "1100111111111111111111111111111111111111";
	constant PBEE_ERROR_PARITY_MAX   : std_logic_vector := "1101111111111111111111111111111111111111";

	-- COMMAND packets start with 111
	constant CMD_MBEE_RECEIVER       : std_logic_vector := "1110000001010101010101010101010101010101";
	constant CMD_MBEE_SENDER         : std_logic_vector := "1111111101010101010101010101010101010101";

	------------------------------------------------------------------------
	-- NUMBERS
	------------------------------------------------------------------------

	-- when the interface switches from sender to receiver
	-- it start's waiting for a trigger.
	-- to avoid interpreting a high impedance line
	-- this "wait"-step is delayed for some clock cycles.
	constant INT_SENDER_RECEIVER_WAIT_DELAY : integer := 2;

end package;
