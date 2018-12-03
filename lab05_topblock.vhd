----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/21/2018 01:36:15 PM
-- Design Name: 
-- Module Name: lab05_topblock - Behavioral
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

entity lab05_topblock is
    Port
    (
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        seg : out STD_LOGIC_VECTOR (7 downto 0);
        an : out STD_LOGIC_VECTOR (3 downto 0)
     );     
end lab05_topblock;

architecture Behavioral of lab05_topblock is
-- internal signals
signal max_tick_1s: std_logic;
signal hex: std_logic_vector(3 downto 0);

-- component declarations
component mod_m_counter
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
end component mod_m_counter;

component seven_seg_display
    Port
    (
        hex: in std_logic_vector(3 downto 0);
        seg: out std_logic_vector(7 downto 0);
        an: out std_logic_vector(3 downto 0)
    );
end component seven_seg_display;

begin
-- instantiation
generate_1s_tick: mod_m_counter
    generic map
    (
        M => 100000000,
        N => 27 -- log2(M)
    )
    port map
    (
        clk => clk,
        rst => rst,
        count => open,
        en => '1',
        max_tick => max_tick_1s
    );

count_16: mod_m_counter
    generic map
    (
        M => 6,
        N => 3 -- log2(M)
    )
    port map
    (
        clk => clk,
        rst => rst,
        count => hex,
        en => max_tick_1s,
        max_tick => open
    );

display_count_value: seven_seg_display
    port map
    (
        hex => hex,
        seg => seg,
        an => an     
    );
end Behavioral;
