----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/21/2018 11:46:35 AM
-- Design Name: 
-- Module Name: register_file_model - Behavioral
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

entity register_file_model is
    generic
    (
        B : integer := 8;
        W : integer := 4
    );
    
    Port
    (
        rst     : in STD_LOGIC;
        clk     : in STD_LOGIC;
        r_addr  : in STD_LOGIC_VECTOR (W-1 downto 0);
        w_addr  : in STD_LOGIC_VECTOR (W-1 downto 0);
        w_data  : in STD_LOGIC_VECTOR (B-1 downto 0);
        w_en    : in STD_LOGIC;
        r_data  : out STD_LOGIC_VECTOR (B-1 downto 0)
    );
end register_file_model;

architecture Behavioral of register_file_model is
-- define new datatype - two dimensional matrix
type register_file is array(2**W-1 downto 0) of std_logic_vector(B-1 downto 0);

-- internal signal
signal register_file_internal: register_file;

begin
process (rst, clk) begin
    if rst = '1' then
        register_file_internal <= (others => (others => '0'));
    elsif rising_edge(clk) then
        if w_en = '1' then
            register_file_internal(to_integer(unsigned(w_addr))) <= w_data;
        end if;
    end if;
end process;

r_data <= register_file_internal(to_integer(unsigned(r_addr)));
end Behavioral;
