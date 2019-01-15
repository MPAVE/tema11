using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _64bit_array
{
    class BitArray64
    {
        public const byte Bits = 64;
        public ulong Number { get; set; }
        public BitArray64(ulong number)
        {
            this.Number = number;
        }
        public override bool Equals(object obj)
        {
            var objBit = obj as BitArray64;
            return this.Number ==objBit.Number;
        }
        
        public static bool operator ==(BitArray64 firstBit, BitArray64 secondBit)
        {
            return firstBit.Equals(secondBit);
        }
        public static bool operator!=(BitArray64 firstBit,BitArray64 secondBit)
        {
            return !(firstBit == secondBit);
        }
        public override int GetHashCode()
        {
            return base.GetHashCode() ^ this.Number.GetHashCode();
        }




    }
}
