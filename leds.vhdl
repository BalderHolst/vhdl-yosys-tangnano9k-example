library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity leds is 

    generic (
        init: std_logic_vector(5 downto 0) := "110011"
    );

    port(
        key: in std_logic;
        rst: in std_logic;
        led: out std_logic_vector(5 downto 0)
    );

end leds;

architecture Structural of leds is

signal pattern: std_logic_vector(5 downto 0) := init;

begin
    process(key)
    begin
        if rst = '0' then
            pattern <= init;
        elsif falling_edge(key) then
            pattern <= pattern(4 downto 0) & pattern(5);
        end if;
        led <= pattern;
    end process;

end Structural;
