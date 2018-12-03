----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/21/2018 01:20:26 PM
-- Design Name: 
-- Module Name: mode_m_counter - Behavioral
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
use IEEE.math_real.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mod_m_counter is
    generic
    (
        M: integer := 10; -- maximum counting value
        N: integer := 4 -- number of D-FF in register
    );
    
    Port
    (
        rst         : in STD_LOGIC;
        clk         : in STD_LOGIC;
        en          : in STD_LOGIC;
        count       : out STD_LOGIC_VECTOR (N-1 downto 0);
        max_tick    : out STD_LOGIC
     );
end mod_m_counter;

architecture Behavioral of mod_m_counter is
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

-- next state logic part
state_next <=   (others => '0') when state_reg = M-1 else
                state_reg + 1;
                
-- output logic
count <= std_logic_vector(state_reg);
max_tick <= '1' when state_reg = M-1 else
            '0';
end Behavioral;
