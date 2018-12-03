----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.09.2018 12:40:05
-- Design Name: 
-- Module Name: shift_register_modelling - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift_register_modelling is
    generic(N: integer := 8);
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           data_in : in STD_LOGIC;
           data_out : out STD_LOGIC;
           en : in STD_LOGIC);
end shift_register_modelling;

architecture Behavioral of shift_register_modelling is
----- internal signal -------
signal state_reg, state_next : STD_LOGIC_VECTOR(N-1 downto 0);

begin
------ register part / sequential block ------
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


------ next state logic part / combination circuit ----
state_next(N-2 downto 0) <= state_reg(N-1 downto 1);
state_next(N-1) <= data_in;                     -------- shift the content of the register one content to the right;

---- output logic / combination circuit -------
data_out <= state_reg(0);

end Behavioral;
