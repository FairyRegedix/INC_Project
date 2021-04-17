-- fsm.vhd: Finite State Machine
-- Author(s): Patrik Demský (xdemsk00) 
--
library ieee;
use ieee.std_logic_1164.all;
-- ----------------------------------------------------------------------------
--                        Entity declaration
-- ----------------------------------------------------------------------------
entity fsm is
port(
   CLK         : in  std_logic;
   RESET       : in  std_logic;

   -- Input signals
   KEY         : in  std_logic_vector(15 downto 0);
   CNT_OF      : in  std_logic;

   -- Output signals
   FSM_CNT_CE  : out std_logic;
   FSM_MX_MEM  : out std_logic;
   FSM_MX_LCD  : out std_logic;
   FSM_LCD_WR  : out std_logic;
   FSM_LCD_CLR : out std_logic
);
end entity fsm;

-- ----------------------------------------------------------------------------
--                      Architecture declaration
-- ----------------------------------------------------------------------------
architecture behavioral of fsm is
   type t_state is (TEST_FIRST, TEST_ERROR, TEST1, TEST12, TEST125, TEST1255, TEST12554, TEST12556, TEST125560, TEST125549, TEST1255604, TEST1255492, TEST12556041, TEST12554924, TEST125560411, TEST125549240, TEST1255604112, TEST1255492404, PRINT_ODEPREN, PRINT_POVOLEN, FINISH);
   signal present_state, next_state : t_state;

begin
-- -------------------------------------------------------
sync_logic : process(RESET, CLK)
begin
   if (RESET = '1') 
	then
      present_state <= TEST_FIRST;
   elsif (CLK'event AND CLK = '1') 
	then
      present_state <= next_state;
   end if;
end process sync_logic;

-- -------------------------------------------------------
next_state_logic : process(present_state, KEY, CNT_OF)
begin
   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
	-- 1
   when TEST_FIRST =>
      next_state <= TEST_FIRST;
		if (KEY(1) = '1') 
		then
			next_state <= TEST1;
      elsif (KEY(15) = '1') 
		then
			next_state <= PRINT_ODEPREN; 
		elsif (KEY(14 downto 0) /= "000000000000000")
		then
			next_state <= TEST_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	--12
	when TEST1 =>
      next_state <= TEST1;
		if (KEY(2) = '1') 
		then
			next_state <= TEST12;
      elsif (KEY(15) = '1') 
		then
			next_state <= PRINT_ODEPREN; 
		elsif (KEY(14 downto 0) /= "000000000000000")
		then
			next_state <= TEST_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	--125
	when TEST12 =>
      next_state <= TEST12;
		if (KEY(5) = '1') 
		then
			next_state <= TEST125;
      elsif (KEY(15) = '1') 
		then
			next_state <= PRINT_ODEPREN; 
		elsif (KEY(14 downto 0) /= "000000000000000")
		then
			next_state <= TEST_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	--1255
	when TEST125 =>
      next_state <= TEST125;
		if (KEY(5) = '1') 
		then
			next_state <= TEST1255;
      elsif (KEY(15) = '1') 
		then
			next_state <= PRINT_ODEPREN; 
		elsif (KEY(14 downto 0) /= "000000000000000")
		then
			next_state <= TEST_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	--12556
	--12554
	when TEST1255 =>
      next_state <= TEST1255;	
		if (KEY(6) = '1') 
		then
			next_state <= TEST12556;
		elsif (KEY(4) = '1') 
		then
			next_state <= TEST12554;
      elsif (KEY(15) = '1') 
		then
			next_state <= PRINT_ODEPREN; 
		elsif (KEY(14 downto 0) /= "000000000000000")
		then
			next_state <= TEST_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	--125560
	when TEST12556 =>
      next_state <= TEST12556;
		if (KEY(0) = '1') 
		then
			next_state <= TEST125560;
      elsif (KEY(15) = '1') 
		then
			next_state <= PRINT_ODEPREN; 
		elsif (KEY(14 downto 0) /= "000000000000000")
		then
			next_state <= TEST_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	--125549
	when TEST12554 =>
      next_state <= TEST12554;
		if (KEY(9) = '1') 
		then
			next_state <= TEST125549;
      elsif (KEY(15) = '1') 
		then
			next_state <= PRINT_ODEPREN; 
		elsif (KEY(14 downto 0) /= "000000000000000")
		then
			next_state <= TEST_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	--1255604
	when TEST125560 =>
      next_state <= TEST125560;
		if (KEY(4) = '1') 
		then
			next_state <= TEST1255604;
      elsif (KEY(15) = '1') 
		then
			next_state <= PRINT_ODEPREN; 
		elsif (KEY(14 downto 0) /= "000000000000000")
		then
			next_state <= TEST_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	--1255492
	when TEST125549 =>
      next_state <= TEST125549;
		if (KEY(2) = '1') 
		then
			next_state <= TEST1255492;
      elsif (KEY(15) = '1') 
		then
			next_state <= PRINT_ODEPREN; 
		elsif (KEY(14 downto 0) /= "000000000000000")
		then
			next_state <= TEST_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	--12556041
	when TEST1255604 =>
      next_state <= TEST1255604;
		if (KEY(1) = '1') 
		then
			next_state <= TEST12556041;
      elsif (KEY(15) = '1') 
		then
			next_state <= PRINT_ODEPREN; 
		elsif (KEY(14 downto 0) /= "000000000000000")
		then
			next_state <= TEST_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	--12554924
	when TEST1255492 =>
      next_state <= TEST1255492;
		if (KEY(4) = '1') 
		then
			next_state <= TEST12554924;
      elsif (KEY(15) = '1') 
		then
			next_state <= PRINT_ODEPREN; 
		elsif (KEY(14 downto 0) /= "000000000000000")
		then
			next_state <= TEST_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	--125560411
	when TEST12556041 =>
      next_state <= TEST12556041;
		if (KEY(1) = '1') 
		then
			next_state <= TEST125560411;
      elsif (KEY(15) = '1') 
		then
			next_state <= PRINT_ODEPREN; 
		elsif (KEY(14 downto 0) /= "000000000000000")
		then
			next_state <= TEST_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	--125549240
	when TEST12554924 =>
      next_state <= TEST12554924;
		if (KEY(0) = '1') 
		then
			next_state <= TEST125549240;
      elsif (KEY(15) = '1') 
		then
			next_state <= PRINT_ODEPREN; 
		elsif (KEY(14 downto 0) /= "000000000000000")
		then
			next_state <= TEST_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	--1255604112
	when TEST125560411 =>
      next_state <= TEST125560411;
		if (KEY(2) = '1') 
		then
			next_state <= TEST1255604112;
      elsif (KEY(15) = '1') 
		then
			next_state <= PRINT_ODEPREN; 
		elsif (KEY(14 downto 0) /= "000000000000000")
		then
			next_state <= TEST_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	--1255492404
	when TEST125549240 =>
      next_state <= TEST125549240;
		if (KEY(4) = '1') 
		then
			next_state <= TEST1255492404;
      elsif (KEY(15) = '1') 
		then
			next_state <= PRINT_ODEPREN; 
		elsif (KEY(14 downto 0) /= "000000000000000")
		then
			next_state <= TEST_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	--vystup : 1255604112
	when TEST1255604112 =>
      next_state <= TEST1255604112;
      if (KEY(15) = '1') 
		then
			next_state <= PRINT_POVOLEN; 
		elsif (KEY(14 downto 0) /= "000000000000000")
		then
			next_state <= TEST_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	-- vystup : 1255492404
	when TEST1255492404 =>
      next_state <= TEST1255492404;
      if (KEY(15) = '1') 
		then
			next_state <= PRINT_POVOLEN; 
		elsif (KEY(14 downto 0) /= "000000000000000")
		then
			next_state <= TEST_ERROR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_ODEPREN =>
      next_state <= PRINT_ODEPREN;
      if (CNT_OF = '1') 
		then
         next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRINT_POVOLEN =>
      next_state <= PRINT_POVOLEN;
      if (CNT_OF = '1') 
		then
         next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST_ERROR =>
      next_state <= TEST_ERROR;
      if (KEY(15) = '1') 
		then
			next_state <= PRINT_ODEPREN;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      next_state <= FINISH;
      if (KEY(15) = '1') 
		then
         next_state <= TEST_FIRST; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
      next_state <= TEST_FIRST;
   end case;
end process next_state_logic;

-- -------------------------------------------------------
output_logic : process(present_state, KEY)
begin
   FSM_CNT_CE     <= '0';
   FSM_MX_MEM     <= '0';
   FSM_MX_LCD     <= '0';
   FSM_LCD_WR     <= '0';
   FSM_LCD_CLR    <= '0';

   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_FIRST | TEST_ERROR | TEST1 | TEST12 | TEST125 | TEST1255 | TEST12554 | TEST12556 | TEST125560 | TEST125549 | TEST1255604 | TEST1255492 | TEST12556041 | TEST12554924 | TEST125560411 | TEST125549240 | TEST1255604112 | TEST1255492404 =>
      if (KEY(14 downto 0) /= "000000000000000") 
		then
         FSM_LCD_WR     <= '1';
      end if;
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_ODEPREN =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRINT_POVOLEN =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
		FSM_MX_MEM     <= '1';
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      if (KEY(15) = '1') 
		then
         FSM_LCD_CLR    <= '1';
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
   end case;
end process output_logic;

end architecture behavioral;

