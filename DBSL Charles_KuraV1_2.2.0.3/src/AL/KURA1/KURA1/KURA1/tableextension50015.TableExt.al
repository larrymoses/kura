#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50015 "tableextension50015" extends "Company Information"
{
    fields
    {
        field(50000; "Tel Phone"; Code[30])
        {
        }
        field(50001; Hotline; Code[30])
        {
        }
        field(50002; "Country/Region Name"; Text[50])
        {
        }
        field(59000; "N.S.SF. No."; Code[20])
        {
        }
        field(59001; "N.H.I.F No."; Code[20])
        {
        }
        field(59003; RubberStamp; Blob)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(59008; "Pin No"; Text[30])
        {
        }
        field(70000; "Procurement Support E-mail"; Text[80])
        {
            
        }
        field(70001; "Administrator Email"; Text[80])
        {
            
        }
        field(80000; Vision; Text[255])
        {
            
            Description = 'SPM';
        }
        field(80001; Mission; Text[255])
        {
            
            Description = 'SPM';
        }
        field(80002; Motto; Text[255])
        {
            
            Description = 'SPM';
        }
        field(80003; "Headed By"; Text[255])
        {
            
            Description = 'SPM';
            TableRelation = Positions;
        }
        field(80004; "Current Head"; Text[255])
        {
            
            Description = 'SPM';
            TableRelation = Employee;
        }
        field(80005; "HR Document Link"; Text[255])
        {
            
        }
        field(80006; "Current Head Name"; Text[100])
        {
            
            Description = 'SPM';
        }
        field(80007; "Vendor  Email"; Text[200])
        {
            

            trigger OnValidate()
            begin
                //MailManagement.ValidateEmailAddressField("Vendor  Email");
            end;
        }
        field(80008; "ICT Email"; Text[200])
        {
            

            trigger OnValidate()
            begin
                // MailManagement.ValidateEmailAddressField("ICT Email");
            end;
        }
        field(80009; "Company Abbreviation"; Code[50])
        {
            
        }

        modify("Country/Region Code")
        {
            trigger OnAfterValidate()
            var
            Country: Record "Country/Region";
            begin
                if Country.Get(Rec."Country/Region Code") then
                Rec."Country/Region Name" :=Country.Name;
            end;
        }

    }

    var
        MailManagement: Codeunit Mail;
}

