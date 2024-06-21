#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 55001 "Committee Board Members"
{

    fields
    {
        field(1;Committee;Code[20])
        {
            NotBlank = true;
        }
        field(2;"Code";Code[20])
        {
            NotBlank = true;
            TableRelation = "Staff Establishment Task Lines"."Entry No.";

            trigger OnValidate()
            begin
                if Board.Get(Code) then begin
                //SurName:=Board.Surname;
                Names:=Board."Job Title";
                end;
            end;
        }
        field(4;Names;Text[250])
        {
            Editable = false;
        }
        field(5;Designation;Text[100])
        {
        }
        field(6;Remarks;Text[200])
        {
        }
        field(7;Role;Option)
        {
            OptionCaption = ' ,Chairmain,Secretary,Member';
            OptionMembers = " ",Chairmain,Secretary,Member;
        }
        field(9;"Director No";Code[20])
        {
            TableRelation = Vendor."No." where ("Vendor Type"=filter(Director));

            trigger OnValidate()
            begin
                Directors.Get("Director No");
                Names := Directors.Name;
            end;
        }
    }

    keys
    {
        key(Key1;Committee,"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Board: Record "Staff Establishment Task Lines";
        Directors: Record Vendor;
}

