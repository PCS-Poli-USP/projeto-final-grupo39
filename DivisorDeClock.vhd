library ieee;
use ieee.std_logic_1164.all;

entity DivisorDeClock is
    generic(
	    freq_clock_in : integer := 50_000_000;
		 freq_clock_out : integer := 6_154
		 );
	 port(
	    clock_in: in std_logic;
		clock_out: out std_logic
		 );
end DivisorDeClock;

architecture arch of DivisorDeClock is
    signal count: natural := 0;
	 signal ratio: integer := (freq_clock_in/freq_clock_out)/2;
	 signal clock: std_logic := '0';
begin
   process(clock_in) is 
	begin 
	  if rising_edge(clock_in) then
	    count <= count + 1;
		 if(count >= ratio) then
		   clock <= not clock;
			count <= 1;
		 end if;
	  end if;
	end process;
	clock_out <= clock;
end arch;