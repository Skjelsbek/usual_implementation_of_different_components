----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/21/2018 11:34:03 AM
-- Design Name: 
-- Module Name: register - Behavioral
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

entity register_model is
    generic (N : integer := 8);
    Port
    (
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        en : in STD_LOGIC;
        data_in : in STD_LOGIC_VECTOR (N-1 downto 0);
        data_out : out STD_LOGIC_VECTOR (N-1 downto 0)
    );
end register_model;

architecture Behavioral of register_model is

begin

process (rst, clk) begin
    if rst = '1' then
        data_out <= (others => '0');
    elsif rising_edge(clk) then
        if en = '1' then
            data_out <= data_in;
        end if;
    end if;
end process;

end Behavioral;
