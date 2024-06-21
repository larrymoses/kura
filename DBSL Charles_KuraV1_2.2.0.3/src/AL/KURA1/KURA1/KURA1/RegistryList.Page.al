
Page 59086 "Registry List"
{
    ApplicationArea = Basic;
    CardPageID = "Registry File Creation";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Registry File Creation";
    UsageCategory = Lists;
    SourceTableView = sorting("Entry No.") order(Ascending);
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("System No"; Rec."System No")
                {
                    ApplicationArea = Basic;
                }
                field("File No"; Rec."File No")
                {
                    ApplicationArea = Basic;
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                }
                field("File Type"; Rec."File Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'File Name';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
    var
        Truncated: Integer;

    trigger OnAfterGetRecord()
    var

    begin

        //Rec."Entry No." := 
    end;

    trigger OnOpenPage()
    begin
        getintegers();
    end;

    procedure getintegers()
    var
        Regex: Codeunit Regex;
        Regexsplitwr: Codeunit "RegEx Split Wrapper";
        LastIndex: Integer;
        RegexOptions: Record "Regex Options";
        Registry: Record "Registry File Creation";
        Int: Integer;
        oK: Boolean;
        J: Integer;
        i: Integer;
        ReverseFileNo: Code[50];
        L: Label '/';
        K: Integer;
        str: Text;
        m: Integer;
        CharNo: Integer;
        Letter: Char;
        N: Integer;
        O:Integer;
        EntryNo: Code[50];
        IntEntry: Integer;
        ValueText:Text;
        CustomFunction: Codeunit "Custom Function";
    begin
        // Registry.Reset();
        // Registry.SetRange("Entry No.", 0);
        // if Registry.FindSet() then begin
        //     repeat
        //         J := 0;
        //         k := 0;
        //         i := 0;
        //         // L:=0
        //         M := 0;
        //         N := 0;
        //         O := 0;
        //         Str := '';
        //         CharNo := 0;
        //         ValueText := '';
        //         IntEntry := 0;
        //         EntryNo := '';
        //         // Letter:='';
        //         ReverseFileNo := '';
        //         //J  :=STRLEN(Registry."File No");
        //         FOR I := STRLEN(Registry."File No") DOWNTO 1 DO BEGIN
        //            // if Registry."File No"[I] <> '' then begin
        //                 J := J + 1;
        //                 ReverseFileNo[J] := Registry."File No"[I];
        //           //  end;
        //         END;
        //         k := 0;
        //         K := StrPos(ReverseFileNo, '/');

        //         for m := 1 to (k - 1) do begin
        //             CharNo := ReverseFileNo[M];
        //             Letter := CharNo;
        //             Str += format(Letter);
        //         end;

        //         O := 0;
        //         FOR M := STRLEN(Str) DOWNTO 1 DO BEGIN
        //             O += 1;
        //             EntryNo[O] := Str[M];
        //         END;
        //         ValueText := EntryNo;
        //         Evaluate(IntEntry, ValueText);
        //         if Registry.Rename(Registry."File No", IntEntry) then
        //             Registry.Modify();
        //         Registry.Modify();
        //     // end;
        //     until Registry.Next() = 0;
        // end;
    end;
}



