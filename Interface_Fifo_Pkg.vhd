library ieee;
use ieee.std_logic_1164.all;





--------------------------------------------------------------------------------
-- P A C K A G E
--------------------------------------------------------------------------------
package Interface_Fifo_Pkg is

	-- HENNING: change to adjust to hardware setup
	constant FIFO_BUS_WIDTH : integer := 4;

	-- record for input signals
	type Interface_Fifo_Rec_In is record
		rst       : std_logic;
		wr_clk    : std_logic;
		wr_en     : std_logic;
		din       : std_logic_vector(FIFO_BUS_WIDTH - 1 downto 0);
		rd_clk    : std_logic;
		rd_en     : std_logic;
	end record;

	-- record for output signals
	type Interface_Fifo_Rec_Out is record
		wr_ack    : std_logic;
		dout      : std_logic_vector(FIFO_BUS_WIDTH - 1 downto 0);
		valid     : std_logic;
		full      : std_logic;
		prog_full : std_logic;
		empty     : std_logic;
	end record;

end package;
