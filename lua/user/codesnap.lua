local status_ok, codesnap = pcall(require, "codesnap")
if not status_ok then
	return
end

codesnap.setup({
    mac_window_bar = true,
    title = "",
	code_font_family = "FiraCode Nerd Font Mono",
    watermark_font_family = "Pacifico",
    watermark = "",
  	bg_color = "#8877ff",
    breadcrumbs_separator = "/",
    has_breadcrumbs = true,
    has_line_number = true,
    show_workspace = false,
    save_path = "/Users/nmadnani/Desktop",
})
