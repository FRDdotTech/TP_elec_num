library ieee;


use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_signed.ALL;


entity fibo_e is
	port(clk, en, rst : in std_logic;
			N : in std_logic_vector(7 downto 0);
			data_out: out std_logic_vector(15 downto 0):=x"0001");
end entity;

architecture fibo_a of fibo_e is
	
begin	
	process
	variable previous_value, next_value : std_logic_vector(15 downto 0):= x"0000";
	variable current_value : std_logic_vector(15 downto 0):= x"0001";
	
	begin
	wait until clk'event and clk='0';
	if rst = '0' then
		previous_value := x"0000";
		next_value := x"0000";
		current_value := x"0001";
	end if;
	if en = '1' then
		next_value := current_value + previous_value;
		previous_value := current_value;
		current_value := next_value;
		data_out <= current_value;
	end if;
	end process;
	
end architecture;