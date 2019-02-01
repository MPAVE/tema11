//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EntityFramework
{
    using System;
    using System.Collections.Generic;
    
    public partial class Address
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Address()
        {
            this.Libraries = new HashSet<Library>();
            this.Members = new HashSet<Member>();
        }
    
        public int AddressID { get; set; }
        public string Street { get; set; }
        public Nullable<int> BuildingNumber { get; set; }
        public string BuildingName { get; set; }
        public string EntranceNumber { get; set; }
        public Nullable<int> FloorNr { get; set; }
        public Nullable<int> ApartmentNumber { get; set; }
        public string City { get; set; }
        public int PostalCode { get; set; }
        public string County { get; set; }
        public string OtherDetails { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Library> Libraries { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Member> Members { get; set; }
    }
}
