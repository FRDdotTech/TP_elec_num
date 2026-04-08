library ieee;


use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_signed.ALL;


entity prescaler_e is
	port(clk_in: in std_logic;
			N : in std_logic_vector(15 downto 0);
			clk_out: out std_logic);
end entity;

architecture prescaler_a of prescaler_e is
	
begin	
	process (clk_in)
	variable count : std_logic_vector(15 downto 0):= x"0000";
	variable rst_flag : std_logic := '0';
	begin
	if clk_in'event and clk_in='1' then
		clk_out <= '0';
		if rst_flag = '1'then
			count := x"0000";
			rst_flag := '0';
		end if;
		count := count + 1;
	
		if count = N then
			clk_out <= '1';
			rst_flag := '1';
		end if;
	end if;
	end process;
	
end architecture;