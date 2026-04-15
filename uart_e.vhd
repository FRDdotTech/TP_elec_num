library ieee;


use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_signed.ALL;


entity uart_e is
	port(clk, en, rst, br : in std_logic;
			data_valid : in std_logic := '1';
			TX: out std_logic := '1');
end entity;

architecture uart_a of uart_e is
	
begin	
	
	process (clk, en, br)
	variable message_bit_count, en_flag : integer := 0;
	variable message : std_logic_vector(8 downto 0);
	begin
	
	if data_valid = '1' then
		message := b"110000010";	--char "A" LSB fisrt
	else
		message := b"110000100";	--char "B" LSB fisrt
	end if;
	
	if clk'event and clk = '1' then
		if en = '1' then
			en_flag := 1;
		end if;
		if br = '1' and en_flag = 1 then
				TX <= message(message_bit_count);
				message_bit_count := message_bit_count + 1;
		if message_bit_count = 9 then
			message_bit_count := 0;
			en_flag := 0;
		end if;
		end if;
		end if;
		
	end process;
	
end architecture;