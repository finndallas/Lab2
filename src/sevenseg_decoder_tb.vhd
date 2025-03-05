----------------------------------------------------------------------------------
 
-- Company:
 
-- Engineer:
 
--
 
-- Create Date: 03/04/2025 11:11:23 AM
 
-- Design Name:
 
-- Module Name: sevenseg_decoder_tb - Behavioral
 
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
 

entity sevenseg_decoder_tb is
 
    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
 
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
 
end sevenseg_decoder_tb;
architecture Behavioral of sevenseg_decoder_tb is

 
component sevenseg_decoder is
 
        Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
 
               o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
 
   end component sevenseg_decoder;
 
    signal w_7SD_EN_n : std_logic;
    signal w_addends  : std_logic_vector(3 downto 0); 
	signal w_seg_n  : std_logic_vector (6 downto 0);
 
begin
 
    sevenseg_decoder1 : sevenseg_decoder
        port map(
            i_Hex => w_addends(3 downto 0),
 
            o_seg_n => w_seg_n
        );
 
    test_process : process
 
    begin
 
        --|Test0
 
        w_addends <= "0000"; wait for 10 ns;
 
        assert(w_seg_n = "1000000") report "bad with zero" severity failure;
 
        --|Test1
 
        w_addends <= "0001"; wait for 10 ns;
 
        assert(w_seg_n = "1111001") report "bad with one" severity failure;
 
        --|Test2
 
        w_addends <= "0010"; wait for 10 ns;
 
        assert(w_seg_n = "0100100") report "bad with two" severity failure;
 
        --|Test3
 
        w_addends <= "0011"; wait for 10 ns;
 
        assert(w_seg_n = "0110000") report "bad with three" severity failure;
 
        --|Test4
 
        w_addends <= "0100"; wait for 10 ns;
 
        assert(w_seg_n = "0011001") report "bad with four" severity failure;
 
        --|Test5
 
        w_addends <= "0101"; wait for 10 ns;
 
        assert(w_seg_n = "0010010") report "bad with five" severity failure;
 
        --|Test6
 
        w_addends <= "0110"; wait for 10 ns;
 
        assert(w_seg_n = "0000010") report "bad with six" severity failure;
 
        --|Test7
 
        w_addends <= "0111"; wait for 10 ns;
 
        assert(w_seg_n = "1111000") report "bad with seven" severity failure;
 
        --|Test8
 
        w_addends <= "1000"; wait for 10 ns;
 
        assert(w_seg_n = "0000000") report "bad with eight" severity failure;
 
        --|Test9
 
        w_addends <= "1001"; wait for 10 ns;
 
        assert(w_seg_n = "0011000") report "bad with nine" severity failure;
 
        --|TestA
 
        w_addends <= "1010"; wait for 10 ns;
 
        assert(w_seg_n = "0001000") report "bad with A" severity failure;
 
        --|TestB
 
        w_addends <= "1011"; wait for 10 ns;
 
        assert(w_seg_n = "0000011") report "bad with B" severity failure;
 
        --|TestC
 
        w_addends <= "1100"; wait for 10 ns;
 
        assert(w_seg_n = "0100111") report "bad with C" severity failure;
 
        --|TestD
 
        w_addends <= "1101"; wait for 10 ns;
 
        assert(w_seg_n = "0100001") report "bad with D" severity failure;
 
        --|TestE
 
        w_addends <= "1110"; wait for 10 ns;
 
        assert(w_seg_n = "0000110") report "bad with E" severity failure;
 
        --|TestF
 
        w_addends <= "1111"; wait for 10 ns;
 
        assert(w_seg_n = "0001110") report "bad with F" severity failure;
 
            wait;
 
       end process;
 
end Behavioral;