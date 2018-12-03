----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/21/2018 11:22:56 AM
-- Design Name: 
-- Module Name: d_ff_rst_en - Behavioral
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

entity d_ff_rst_en is
    Port
    (
        rst : in std_logic;
        clk : in std_logic;
        en  : in std_logic;
        d   : in std_logic;
        q   : out std_logic
    );
end d_ff_rst_en;

architecture Behavioral of d_ff_rst_en is

begin
process (rst, clk) begin
    if rst = '1' then
        q <= '0';
    elsif rising_edge(clk) then
        if en = '1' then
            q <= d;
        end if;
    end if;
end process;

end Behavioral;
