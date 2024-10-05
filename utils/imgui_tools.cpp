//
//  ImguiTools.cpp
//  Dolphins
//
//  Created by xbk on 2022/4/25.
//

#include "imgui_tools.h"

void HelpMarker(const char *desc) {
    ImGui::TextColored(ImVec4(1.0f, 0.0f, 0.0f, 1.0f), "(?)");
    if (ImGui::IsItemHovered()) {
        ImGui::BeginTooltip();
        ImGui::PushTextWrapPos(ImGui::GetFontSize() * 45.0f);
        ImGui::TextUnformatted(desc);
        ImGui::PopTextWrapPos();
        ImGui::EndTooltip();
    }
}

float calcTextSize(const char *text, float font_size) {
    ImGuiContext &g = *GImGui;
    
    ImFont *font = g.Font;
    
    ImVec2 text_size;
    if (font_size == 0) {
        text_size = font->CalcTextSizeA(font->FontSize, FLT_MAX, -1.0f, text, NULL, NULL);
    } else {
        text_size = font->CalcTextSizeA(font_size, FLT_MAX, -1.0f, text, NULL, NULL);
    }
    
    text_size.x = IM_FLOOR(text_size.x + 0.99999f);
    
    return text_size.x;
}

void setDarkTheme() {
    ImGuiStyle *style = &ImGui::GetStyle();
    
    // 设置更大的圆角值
    style->WindowRounding = 15.0f;         // 窗口圆角半径
    style->FrameRounding = 15.0f;          // 框体圆角半径
    style->ChildRounding = 15.0f;          // 子窗口圆角半径
    style->FramePadding = ImVec2(4, 7);    // 框体内部填充
    style->ScrollbarSize = 40;              // 滚动条大小
    style->GrabMinSize = 23;                // 滑块最小尺寸
    style->WindowTitleAlign = ImVec2(0.5, 0.5);  // 标题居中

    ImVec4* colors = style->Colors;

    // 颜色配置，统一设置为半透明
    colors[ImGuiCol_Text]                   = ImVec4(0.00f, 0.00f, 0.00f, 1.00f);
    colors[ImGuiCol_TextDisabled]           = ImVec4(0.00f, 0.00f, 0.00f, 0.00f);
    colors[ImGuiCol_WindowBg]               = ImVec4(1.0f, 1.0f, 1.0f, 0.9f);  // 窗口背景半透明
    colors[ImGuiCol_ChildBg]                = ImVec4(1.0f, 1.0f, 1.0f, 0.0f); // 子窗口背景透明
    colors[ImGuiCol_PopupBg]                = ImVec4(1.0f, 1.0f, 1.0f, 0.0f); // 弹出窗口背景透明
    colors[ImGuiCol_Border]                 = ImVec4(1.0f, 1.0f, 1.0f, 0.3f); // 边框半透明
    colors[ImGuiCol_BorderShadow]           = ImVec4(0.00f, 0.00f, 0.00f, 0.00f);
    colors[ImGuiCol_FrameBg]                = ImVec4(1.0f, 1.0f, 1.0f, 0.9f); // 框体背景半透明
    colors[ImGuiCol_FrameBgHovered]         = ImVec4(1.0f, 1.0f, 1.0f, 0.9f);
    colors[ImGuiCol_FrameBgActive]          = ImVec4(0.73f, 0.90f, 1.0f, 0.5f); // 活动框体背景半透明
    colors[ImGuiCol_TitleBg]                = ImVec4(1.0f, 1.0f, 1.0f, 0.87f); // 标题栏背景半透明
    colors[ImGuiCol_TitleBgActive]          = ImVec4(1.0f, 1.0f, 1.0f, 0.87f);
    colors[ImGuiCol_TitleBgCollapsed]       = ImVec4(1.0f, 1.0f, 1.0f, 0.87f);
    colors[ImGuiCol_MenuBarBg]              = ImVec4(0.14f, 0.14f, 0.14f, 0.1f); // 菜单栏背景半透明

    colors[ImGuiCol_ScrollbarBg]            = ImVec4(0.98f, 0.98f, 0.98f, 0.5f); // 滚动条背景半透明
    colors[ImGuiCol_ScrollbarGrab]          = ImVec4(0.49f, 0.49f, 0.49f, 0.5f); // 滚动条抓取半透明
    colors[ImGuiCol_ScrollbarGrabHovered]   = ImVec4(0.49f, 0.49f, 0.49f, 0.7f);
    colors[ImGuiCol_ScrollbarGrabActive]    = ImVec4(0.49f, 0.49f, 0.49f, 0.9f);
    colors[ImGuiCol_CheckMark]              = ImVec4(0.23f, 0.58f, 0.99f, 1.0f);
    colors[ImGuiCol_SliderGrab]             = ImVec4(0.26f, 0.58f, 0.98f, 0.8f);
    colors[ImGuiCol_SliderGrabActive]       = ImVec4(0.26f, 0.58f, 0.98f, 1.0f);
    colors[ImGuiCol_Button]                  = ImColor(58, 160, 110, 255).Value;
    colors[ImGuiCol_ButtonHovered]           = ImColor(58, 160, 110, 255).Value;
    colors[ImGuiCol_ButtonActive]            = ImColor(70, 195, 132, 255).Value;
    colors[ImGuiCol_Header]                  = ImVec4(0.26f, 0.59f, 0.98f, 0.4f); // 半透明Header
    colors[ImGuiCol_HeaderHovered]           = ImVec4(0.26f, 0.59f, 0.98f, 0.6f);
    colors[ImGuiCol_HeaderActive]            = ImVec4(0.00f, 0.59f, 1.0f, 0.8f);
    colors[ImGuiCol_Separator]               = ImVec4(0.43f, 0.43f, 0.50f, 0.5f);
    colors[ImGuiCol_SeparatorHovered]        = ImVec4(0.10f, 0.40f, 0.75f, 0.6f);
    colors[ImGuiCol_SeparatorActive]         = ImVec4(0.10f, 0.40f, 0.75f, 0.8f);
    colors[ImGuiCol_ResizeGrip]              = ImVec4(0.26f, 0.59f, 0.98f, 0.2f);
    colors[ImGuiCol_ResizeGripHovered]       = ImVec4(0.26f, 0.59f, 0.98f, 0.6f);
    colors[ImGuiCol_ResizeGripActive]        = ImVec4(0.26f, 0.59f, 0.98f, 0.8f);

    colors[ImGuiCol_PlotLines]               = ImVec4(0.61f, 0.61f, 0.61f, 1.0f);
    colors[ImGuiCol_PlotLinesHovered]        = ImVec4(1.0f, 0.43f, 0.35f, 1.0f);
    colors[ImGuiCol_PlotHistogram]           = ImVec4(0.90f, 0.70f, 0.00f, 1.0f);
    colors[ImGuiCol_PlotHistogramHovered]    = ImVec4(1.00f, 0.60f, 0.00f, 1.0f);
    colors[ImGuiCol_TableHeaderBg]           = ImVec4(0.33f, 0.33f, 0.33f, 0.2f);
    colors[ImGuiCol_TableBorderStrong]       = ImVec4(1.0f, 1.0f, 1.0f, 0.4f);
    colors[ImGuiCol_TableBorderLight]        = ImVec4(1.0f, 1.0f, 1.0f, 0.3f);
    colors[ImGuiCol_TableRowBg]              = ImVec4(1.0f, 1.0f, 1.0f, 0.9f);
    colors[ImGuiCol_TableRowBgAlt]           = ImVec4(1.0f, 1.0f, 1.0f, 0.7f);
}