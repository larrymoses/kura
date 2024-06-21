#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50011 "tableextension50011" extends "Sales Line"
{
    fields
    {
        modify("Job Task No.")
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting), "Global Dimension 1 Code" = field("Shortcut Dimension 1 Code"),
                                                                     "Job No." = field("Job No."));
        }
        modify("Shortcut Dimension 2 Code")
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false),
                                                          "Region Code" = field("Shortcut Dimension 1 Code"));
        }
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestStatusOpen;
    IF Quantity <> 0 THEN BEGIN
      OnBeforeVerifyReservedQty(Rec,xRec,0);
    #4..9
        ERROR(Text056,SalesHeader."Shipping Advice");
    IF ("Deferral Code" <> '') AND (GetDeferralAmount <> 0) THEN
      UpdateDeferralAmounts;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..12

    SalesHeader.RESET;
    SalesHeader.SETRANGE(SalesHeader."No.","Document No.");
    SalesHeader.SETRANGE(SalesHeader."Document Type","Document Type");
    IF SalesHeader.FINDSET THEN BEGIN
      "Shortcut Dimension 1 Code":=SalesHeader."Responsibility Center";
    END;

    //Insert Employee Deatails
    IF UserSetup.GET(USERID) THEN  BEGIN
      Employee.RESET;
      Employee.SETRANGE(Employee."No.",UserSetup."Employee No." );
      IF Employee.FINDSET THEN BEGIN
          "Shortcut Dimension 2 Code":=Employee."Global Dimension 2 Code";
          "Shortcut Dimension 3 Code":=Employee."Department Code";
          //MESSAGE("Shortcut Dimension 3 Code");
          "Shortcut Dimension 4 Code":=Employee.Division;
          "Shortcut Dimension 5 Code":=Employee."Directorate Code";
          //MESSAGE("Shortcut Dimension 5 Code");
          "Shortcut Dimension 3 Code":=Employee.Department;
          "Shortcut Dimension 5 Code":=Employee."Directorate Code";
          "Shortcut Dimension 4 Code":=Employee."Directorate Code";
        END;
      END;
    */
    //end;

    var
        UserSetup: Record "User Setup";
        Employee: Record Employee;
}

