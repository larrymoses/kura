
Table 59019 "Travel Requisition Non Staff"
{

    fields
    {
        field(1; "Req No"; Code[20])
        {
            TableRelation = "Transport Requisition"."Transport Requisition No";
        }
        field(2; "ID No"; Code[20])
        {
        }
        field(3; Name; Text[70])
        {
        }
        field(4; Position; Text[70])
        {
        }
        field(5; "Daily Work Ticket"; Code[20])
        {

            trigger OnValidate()
            begin
                DwTicket.Reset;
                DwTicket.SetRange(DwTicket."Transport Requisition No", "Req No");
                if DwTicket.Find('-') then;
                //  "Daily Work Ticket":=DwTicket."Work Ticket No";
            end;
        }
        field(6; EntryNo; Integer)
        {
            AutoIncrement = true;
        }
        field(7; "Phone Number"; Code[15])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Purpose; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Designation; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Req No", "ID No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HrEmployee: Record Employee;
        DwTicket: Record "Transport Requisition";
}

