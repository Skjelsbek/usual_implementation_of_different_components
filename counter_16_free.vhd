----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/21/2018 12:57:57 PM
-- Design Name: 
-- Module Name: counter_16_free - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_16_free is
    generic
    (
        N: integer := 4
    );
    Port
    (
        rst, clk, en: in std_logic;
        count: out std_logic_vector(N-1 downto 0)
    );
end counter_16_free;

architecture Behavioral of counter_16_free is
-- internal signal
signal state_next, state_reg: unsigned(N-1 downto 0);

begin
-- register part
process (clk, rst)
    begin
        if(rst = '1') then
            state_reg <= (others => '0');
        elsif(rising_edge(clk)) then  --clk'event and clk = '1'
            if(en='1') then
                state_reg <= state_next;
            end if;
        end if;
    end
process;

-- next state logic
state_next <= state_reg + 1;

-- output part
count <= std_logic_vector(state_reg);
end Behavioral;
